require "active_support/concern"

module DebugExtras
  module ActionView
    def dump(object)
      $debug_extras_add_styles = true
      Dumper.new(object, 'debug-dump').render
    end
  end
end
