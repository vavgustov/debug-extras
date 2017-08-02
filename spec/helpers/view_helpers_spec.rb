require_relative '../spec_helper'

RSpec.describe DebugExtras::Helpers::ViewHelpers do
  let(:view) do
    Class.new do
      extend DebugExtras::Helpers::ViewHelpers
      extend ActionView::Helpers::OutputSafetyHelper
    end
  end

  it '#rap' do
    expect(view.rap('data')).to match('data')
  end

  it '#object_dump' do
    expect(view.object_dump('data')).to match('String')
  end
end