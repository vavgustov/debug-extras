require 'debug_extras/error_page'

module DebugExtras
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      env['puma.config'].options.user_options.delete(:app) if env.has_key?('puma.config')
      @app.call env
    rescue StandardError => ex
      if [ex.class, ex.cause.class].map(&:to_s).include? 'DebugExtras::DebugData'
        error_page = ErrorPage.new(ex, Rails.env["PATH_INFO"])
        [200, { "Content-Type" => "text/html; charset=utf-8" }, [error_page.render]]
      else
        @app.call env
      end
    end
  end
end