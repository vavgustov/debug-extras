module DebugExtras
  module Settings
    class << self
      def options
        {
          html: true,
          color: {
            array: :yellowish,
            class: :cyanish
          }
        }
      end
    end
  end
end
