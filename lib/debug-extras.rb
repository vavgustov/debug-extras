require "active_support/concern"
require "active_support/dependencies/autoload"
require "active_support/lazy_load_hooks"

module DebugExtras
  extend ActiveSupport::Autoload

  autoload :DebugPage
  autoload :Dumper
  autoload :Injector
  autoload :Settings
end

ActiveSupport.on_load :action_view do
  require "debug_extras/ext/action_view"
  ::ActionView::Base.send :include, DebugExtras::ActionView
end

ActiveSupport.on_load :action_controller do
  require "debug_extras/ext/action_controller"
  ::ActionController::Base.send :include, DebugExtras::ActionController
end

require "debug_extras/core_ext/kernel"
require "debug_extras/exceptions"
require "debug_extras/version"

require "debug_extras/railtie" if defined? Rails::Railtie
