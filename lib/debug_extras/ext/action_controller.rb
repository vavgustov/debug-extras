module DebugExtras
  module ActionController
    extend ActiveSupport::Concern

    included do
      after_action :debug_extras_inject
    end

    private

    def debug_extras_inject
      injector = Injector.new(response)
      response.body = injector.process_response
    end
  end
end
