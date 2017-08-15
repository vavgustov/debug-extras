require "active_support/dependencies/autoload"
require "active_support/lazy_load_hooks"
require "debug_extras/core_ext/kernel"
require "debug_extras/version"

module DebugExtras
  extend ActiveSupport::Autoload

  autoload :DebugPage
  autoload :Dumper
  autoload :Middleware
  autoload :Settings

  ActiveSupport.on_load :action_view do
    require "debug_extras/helpers/view_helpers"
    ::ActionView::Base.send :include, DebugExtras::Helpers::ViewHelpers
  end
end

require "debug_extras/railtie" if defined? Rails::Railtie
