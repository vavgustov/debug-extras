module DebugExtras
  class Injector
    def initialize(response)
      @response = response
    end

    def process_response
      add_messages
      add_styles
      @response.body
    end

    private

    def add_messages
      return if $debug_extras_messages.blank? || !@response.headers['Content-Type'].include?('html')
      $debug_extras_messages.map! { |message| DebugExtras::Dumper.new(message, 'debug-wp').render }
      injection = $debug_extras_messages.join('')
      @response.body = inject_html('<body>') { |html| html[1].prepend(injection) }
    end

    def add_styles
      return unless $debug_extras_add_styles
      injection = File.read(File.expand_path('../templates/styles.html', __FILE__))
      @response.body = inject_html('</head>') { |html| html[0] << injection }
    end

    def inject_html(tag, &block)
      html = @response.body.split(tag)
      yield html if block_given?
      html.join(tag)
    end
  end
end
