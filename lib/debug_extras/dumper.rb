require "action_view"
require "awesome_print"

module DebugExtras
  class Dumper
    include ::ActionView::Context
    include ::ActionView::Helpers::TagHelper

    def initialize(dump, css_class)
      @dump = dump
      @css_class = "debug-extras #{css_class}"
    end

    def render
      message = content_tag(:div, class: @css_class) { @dump.ai(Settings.options).html_safe }
      yield message if block_given?
      message
    end
  end
end
