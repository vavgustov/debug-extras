require "spec_helper"

RSpec.describe DebugExtras do
  let(:view) { ActionView::Base.new }

  it "add #dump to ActionView" do
    expect(view.respond_to?(:dump)).to be true
  end

  it "has a version number" do
    expect(DebugExtras::VERSION).not_to be nil
  end
end
