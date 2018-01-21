module DebugExtras
  module ActionController
    def render(*args)
      super
      debug_extras_add_messages
      debug_extras_add_styles
    end

    private

    def debug_extras_add_messages
      return if $debug_extras_messages.blank? || !response.headers['Content-Type'].include?('html')
      $debug_extras_messages.map! { |message| DebugExtras::Dumper.new(message, 'debug-wp').render }
      injection = $debug_extras_messages.join('')
      self.response.body = debug_extras_inject_html('<body>') { |html| html[1].prepend(injection) }
    end

    def debug_extras_add_styles
      return unless $debug_extras_add_styles
      injection = File.read(File.expand_path('../../templates/styles.html', __FILE__))
      self.response.body = debug_extras_inject_html('</head>') { |html| html[0] << injection }
    end

    def debug_extras_inject_html(tag, &block)
      html = self.response.body.split(tag)
      yield html if block_given?
      html.join(tag)
    end
  end
end
