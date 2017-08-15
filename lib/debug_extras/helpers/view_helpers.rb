require "active_support/concern"

module DebugExtras
  module Helpers
    module ViewHelpers
      extend ActiveSupport::Concern

      def dump(object, settings = {})
        Dumper.new(object, settings).render
      end
    end
  end
end
