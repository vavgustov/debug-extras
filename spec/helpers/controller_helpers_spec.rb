require_relative '../spec_helper'

RSpec.describe DebugExtras::Helpers::ControllerHelpers do
  let(:controller) { Class.new { extend DebugExtras::Helpers::ControllerHelpers } }

  it '#debug' do
    # TODO: what is a correct way to test abort without rspec stop?
    # expect(controller.debug('data')).to output(/data/).to_stdout
  end
end
