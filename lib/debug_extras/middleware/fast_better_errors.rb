module DebugExtras
  # based on https://github.com/charliesome/better_errors/issues/341 proposals
  class FastBetterErrors
    def initialize(app)
      @app = app
    end

    def call(env)
      env["puma.config"].options.user_options.delete(:app) if env.has_key?("puma.config")
      @app.call env
    end
  end
end
