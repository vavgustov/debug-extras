module DebugExtras
  module Settings
    class << self
      def ap_options
        { html: true, color: { array: :yellowish } }
      end

      def ap_styles(tag)
        {
          pre: {
            "background" => "#f5f8fa",
            "border" => "1px solid #ccc",
            "border-radius" => "0",
            "color" => "#111",
            "font-family" => "Menlo, Consolas, Ubuntu, monospace",
            "font-weight" => "bold",
            "font-size" => "12px",
            "line-height" => "1.43",
            "margin" => "0 0 10px",
            "padding" => "10px",
            "white-space" => "pre-wrap",
          },
          kbd: {
            "background" => "none",
            "box-shadow" => "none",
            "font-family" => "Menlo, Consolas, Ubuntu, monospace",
            "font-weight" => "bold",
            "font-size" => "12px",
            "padding" => "2px 4px"
          }
        }[tag]
      end
    end
  end
end
