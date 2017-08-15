require "debug_extras/exceptions"

module Kernel
  # dump object through exception message
  def dd(dump, settings = {})
    DebugExtras::Dumper.new(dump, settings).render do |message|
      raise DebugExtras::DebugData, message
    end
  end
end
