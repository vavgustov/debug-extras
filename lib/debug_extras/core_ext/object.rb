require 'debug_extras/exceptions'

class Object
  def dd(message, settings = {})
    prefix = message.class.to_s
    prefix << "##{message.length}" if message.respond_to? :length
    settings.merge! DebugExtras::Settings.ap_options
    output = prefix + message.ai(settings)
    raise DebugExtras::DebugData.new(output)
  end
end
