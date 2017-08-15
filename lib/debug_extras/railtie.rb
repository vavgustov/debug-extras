require "debug_extras/middleware/debug"
require "debug_extras/middleware/fast_better_errors"

module DebugExtras
  class Railtie < Rails::Railtie
    initializer "debug_extras.configure_rails_initialization" do
      if Rails.env.development?
        insert_middleware(DebugExtras::Debug)
        insert_middleware(DebugExtras::FastBetterErrors) if better_errors_slow?
      end
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

    def better_errors_slow?
      return false unless defined? BetterErrors && defined? Puma
      BetterErrors.binding_of_caller_available && [Rails.version, Puma::Const::PUMA_VERSION].map(&:to_i) == [5, 3]
    end

    def app
      Rails.application
    end
  end
end
