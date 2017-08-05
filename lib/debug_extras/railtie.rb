module DebugExtras
  class Railtie < Rails::Railtie
    initializer "debug_extras.configure_rails_initialization" do
      if defined? ActionDispatch::DebugExceptions
        app.middleware.insert_after ActionDispatch::DebugExceptions, DebugExtras::Middleware
      else
        app.middleware.use DebugExtras::Middleware
      end
    end

    private

    def app
      Rails.application
    end
  end
end