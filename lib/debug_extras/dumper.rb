require "action_view"
require "awesome_print"

module DebugExtras
  class Dumper
    include ::ActionView::Context
    include ::ActionView::Helpers::TagHelper

    def initialize(dump, css_class)
      @dump = dump
      @css_class = "debug-extras #{css_class}"
      $debug_extras_add_styles = true
    end

    def render
      message = content_tag(:div, class: @css_class) do
        render_object_names(@dump.ai(Settings.options)).html_safe
      end
      yield message if block_given?
      message
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
