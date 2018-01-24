module DebugExtras
  class Injector
    def initialize(response)
      @response = response
      @result = @response.body
    end

    def process_response
      if response_is_html?
        inject_messages
        inject_styles
      end
      @result
    end

    private

    def response_is_html?
      return false unless @response.headers['Content-Type'].include?('html')
      tags = %w[<html <head </head <body </body </html>]
      tags.each do |tag|
        return false unless @response.body.include? tag
      end
      true
    end

    def inject_messages
      return if $debug_extras_messages.blank?
      $debug_extras_messages.map! { |message| DebugExtras::Dumper.new(message, 'debug-wp').render }
      injection = $debug_extras_messages.join('')
      @result = inject_content('<body') do |html|
        body = html.second.split('>')
        body.second.prepend(injection) if body.size > 1
        html[1] = body.join('>')
      end
    end

    def inject_styles
      return unless $debug_extras_add_styles
      injection = File.read(File.expand_path('../templates/styles.html', __FILE__))
      @result = inject_content('</head>') { |html| html.first << injection }
    end

    def inject_content(tag)
      html = @result.split(tag)
      yield html if block_given?
      html.join(tag)
    end
  end
end
