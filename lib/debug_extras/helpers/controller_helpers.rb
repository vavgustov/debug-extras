module DebugExtras::Helpers
  module ControllerHelpers
    extend ActiveSupport::Concern

    def debug(data)
      abort data.ai(html: true)
    end
  end
end
