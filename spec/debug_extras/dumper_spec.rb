require "spec_helper"

RSpec.describe DebugExtras::Dumper do
  let(:dumper) { DebugExtras::Dumper.new('test data', {}) }
  let(:response) {dumper.render}

  it "return correct output" do
    expect(response).to match('test data')
  end
end
