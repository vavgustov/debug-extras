require "spec_helper"

RSpec.describe DebugExtras::Settings do
  it ".options" do
    expect(DebugExtras::Settings.options).not_to be_empty
  end
end