require "action_view"
require "awesome_print"

module DebugExtras
  class Dumper
    include ActionView::Context
    include ActionView::Helpers::TagHelper

    def initialize(dump, settings)
      @dump = dump
      @settings = settings
    end

    def render
      message = content_tag(:div, class: 'debug-extras') do
        @settings.merge! Settings.ap_options

        output = @dump.ai Settings.ap_options
        output = render_object_names output
        output = add_styles_to_tag(:pre, output)
        output = add_styles_to_tag(:kbd, output)

        output.html_safe
      end

      yield message if block_given?

      message
    end

    private

    def convert_hash_to_style(styles)
      styles.map { |k, v| "#{k}: #{v}" }.join('; ')
    end

    def add_styles_to_tag(tag, output)
      case tag
        when :pre
          output.sub!("<pre>", "<pre style=\"#{convert_hash_to_style(Settings.ap_styles(:pre))}\">")
        when :kbd
          output.gsub!("<kbd style=\"", "<kbd style=\"#{convert_hash_to_style(Settings.ap_styles(:kbd))}; ")
        else
          output
      end
      output
    end

    def render_object_names(dump)
      output = ""

      dump.split("<").map.with_index do |v, k|
        if v.include? ":0x" and not (v.include? "kbd" or v.include? "pre")
          v.sub!(">", "")
        else
          output << "<" unless k.zero?
        end
        output << v
      end

      output
    end
  end
end
