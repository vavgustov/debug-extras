require "spec_helper"

RSpec.describe Kernel do
  let(:object) { Object.new }

  it "#dd" do
    expect { object.dd("message") }.to raise_exception(DebugExtras::DebugData)
  end

  it "#wp" do
    object.wp "message"
    added_to_stack = $debug_extras_messages.include? "message"
    expect(added_to_stack).to be true
  end
end
