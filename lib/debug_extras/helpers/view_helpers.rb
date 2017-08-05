module DebugExtras
  module Helpers
    module ViewHelpers
      extend ActiveSupport::Concern

      def rap(object)
        raw ap(object, DebugExtras::Settings.ap_options)
      end
    end
  end
end
