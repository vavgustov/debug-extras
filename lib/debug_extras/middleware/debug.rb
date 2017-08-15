module DebugExtras
  class Debug
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call env
    rescue StandardError => ex
      process_exception(ex, env)
    end

    private

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
