require "erb"

module DebugExtras
  class DebugPage
    def initialize(exception, request_path)
      @exception = exception
      @request_path = request_path
    end

    def render
      template = File.read(File.expand_path("../templates/debug.html.erb", __FILE__))
      styles = File.read(File.expand_path("../templates/styles.html", __FILE__))
      @inject_styles = ERB.new(styles).result(binding)
      ERB.new(template).result(binding)
    end
  end
end
