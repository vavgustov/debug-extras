module DebugExtras
  class Debug
    def initialize(app)
      @app = app
    end

    def call(env)
      reset_stack
      @app.call env
    rescue StandardError => ex
      process_exception(ex, env)
    end

    private

    def reset_stack
      $debug_extras_add_styles = false
      $debug_extras_messages = []
    end

    def process_exception(ex, env)
      if [ex.class, ex.cause.class].map(&:to_s).include? "DebugExtras::DebugData"
        debug_page = DebugPage.new(ex, env["PATH_INFO"])
        [200, { "Content-Type" => "text/html; charset=utf-8" }, [debug_page.render]]
      else
        @app.call env
      end
    end
  end
end
