require "debug_extras/middleware/debug"

module DebugExtras
  class Railtie < Rails::Railtie
    initializer "debug_extras.setup_middleware" do
      insert_middleware(DebugExtras::Debug) if Rails.env.development?
    end

    private

    def insert_middleware(middleware)
      if defined? BetterErrors::Middleware
        app.middleware.insert_before ActionDispatch::Reloader, middleware
      elsif defined? ActionDispatch::DebugExceptions
        app.middleware.insert_after ActionDispatch::DebugExceptions, middleware
      else
        app.middleware.use middleware
      end
    end

    def app
      Rails.application
    end
  end
end
