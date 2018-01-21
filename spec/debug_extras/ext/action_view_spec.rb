require "spec_helper"

RSpec.describe DebugExtras::ActionView do
  let(:view) do
    Class.new do
      extend DebugExtras::ActionView
    end
  end

  it "#dump" do
    expect(view.dump("data")).to match("data")
  end
end
