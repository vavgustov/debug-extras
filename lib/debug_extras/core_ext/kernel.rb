require "debug_extras/exceptions"

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
      $debug_extras_add_styles = true
    end
  end
end
