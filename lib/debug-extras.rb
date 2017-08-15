require "debug_extras/version"
require "active_support/concern"
require "active_support/core_ext/string/output_safety"
require "active_support/dependencies/autoload"
require "active_support/lazy_load_hooks"
require "action_view/helpers/output_safety_helper"
require "awesome_print"
require "debug_extras/core_ext/kernel"

module DebugExtras
  extend ActiveSupport::Autoload

  autoload :Dumper
  autoload :Middleware
  autoload :Settings

  ActiveSupport.on_load :action_view do
    require "debug_extras/helpers/view_helpers"

    ::ActionView::Base.send :include, DebugExtras::Helpers::ViewHelpers
  end
end

require "debug_extras/railtie" if defined? Rails::Railtie
