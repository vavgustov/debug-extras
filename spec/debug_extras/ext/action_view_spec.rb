require "spec_helper"

RSpec.describe DebugExtras::ActionView do
  let(:view) do
    Class.new do
      include DebugExtras::ActionView
    end
  end

  it "#dump" do
    expect(view.new.dump("data")).to match("data")
  end
end
