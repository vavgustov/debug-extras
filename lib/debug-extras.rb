require "active_support/dependencies/autoload"
require "active_support/lazy_load_hooks"
require "debug_extras/core_ext/kernel"
require "debug_extras/debug_page"
require "debug_extras/dumper"
require "debug_extras/settings"

require "debug_extras/version"

module DebugExtras
  extend ActiveSupport::Autoload

  # autoload :DebugPage
  # autoload :Dumper
  # autoload :Settings

  ActiveSupport.on_load :action_view do
    require "debug_extras/ext/action_view"
    ::ActionView::Base.send :include, DebugExtras::ActionView
  end

  ActiveSupport.on_load :action_controller do
    require "debug_extras/ext/action_controller"
    ::ActionController::Base.send :include, DebugExtras::ActionController
  end
end

require "debug_extras/railtie" if defined? Rails::Railtie
