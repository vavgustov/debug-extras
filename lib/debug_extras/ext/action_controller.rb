module DebugExtras
  module ActionController
    def render(*args)
      super
      injector = Injector.new(response)
      response.body = injector.process_response
    end
  end
end
