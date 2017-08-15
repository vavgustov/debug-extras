require "spec_helper"

RSpec.describe DebugExtras::Helpers::ViewHelpers do
  let(:view) do
    Class.new do
      extend DebugExtras::Helpers::ViewHelpers
    end
  end

  it "#dump" do
    expect(view.dump("data")).to match("data")
  end
end
