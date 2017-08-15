require "spec_helper"

RSpec.describe Kernel do
  let(:object) { Object.new }

  it "#dd" do
    expect { object.dd("message") }.to raise_exception(DebugExtras::DebugData)
  end
end