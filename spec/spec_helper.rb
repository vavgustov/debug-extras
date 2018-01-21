require "simplecov"
SimpleCov.start

require "active_support/all"
require "action_controller"
require "debug-extras"
require "debug_extras/ext/action_controller"
require "debug_extras/ext/action_view"
require "debug_extras/middleware/debug"
require "debug_extras/dumper"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
