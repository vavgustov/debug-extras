require "active_support/concern"

module DebugExtras
  module ActionView
    def dump(object)
      Dumper.new(object, 'debug-dump').render
    end
  end
end
