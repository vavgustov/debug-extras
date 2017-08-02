module DebugExtras::Helpers
  module ViewHelpers
    extend ActiveSupport::Concern

    def rap(object)
      raw ap(object)
    end

    def object_dump(object, full = false)
      output = ''
      vars = object.instance_variables

      output << pretty('object class')
      output << pretty(object.class)

      output << pretty('instance variables list')
      output << pretty(vars)

      output << pretty('instance variables details')
      vars.each do |v|
        output << pretty(v)
        output << pretty(object.instance_variable_get(v))
      end

      if full
        output << pretty('methods list')
        output << pretty(object.methods)
      end

      raw output
    end

    private

    def pretty(string)
      string.ai
    end
  end
end
