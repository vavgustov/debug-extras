require 'debug_extras/version'
require 'active_support/concern'
require 'active_support/core_ext/string/output_safety'
require 'active_support/lazy_load_hooks'
require 'awesome_print'

module DebugExtras
  ActiveSupport.on_load :action_view do
    require 'debug_extras/helpers/view_helpers'
    ActionView::Base.send :include, DebugExtras::Helpers::ViewHelpers
  end

  ActiveSupport.on_load :action_controller_base do
    require 'debug_extras/helpers/controller_helpers'
    ActionController::Base.send :include, DebugExtras::Helpers::ControllerHelpers
  end
end
