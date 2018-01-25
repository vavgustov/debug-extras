module Kernel
  # dump object through exception message
  def dd(dump)
    DebugExtras::Dumper.new(dump, 'debug-dd').render do |message|
      raise DebugExtras::DebugData, message
    end
  end

  # print on the html page like php
  def wp(message)
    $debug_extras_messages ||= []
    unless message.blank?
      $debug_extras_messages << message
    end
  end
end
