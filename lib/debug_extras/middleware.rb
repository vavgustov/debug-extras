module DebugExtras
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      better_errors_fix env
      @app.call env
    rescue StandardError => ex
      if [ex.class, ex.cause.class].map(&:to_s).include? "DebugExtras::DebugData"
        debug_page = DebugPage.new(ex, env["PATH_INFO"])
        [200, { "Content-Type" => "text/html; charset=utf-8" }, [debug_page.render]]
      else
        @app.call env
      end
    end

    private

    # based on https://github.com/charliesome/better_errors/issues/341
    def better_errors_fix(env)
      env["puma.config"].options.user_options.delete(:app) if env.has_key?("puma.config")
    end
  end
end