require "spec_helper"

RSpec.describe DebugExtras::ErrorPage do
  let(:error_page) { DebugExtras::ErrorPage.new(Exception.new('ex message'), 'test path') }
  let(:response) { error_page.render }

  it "render request path" do
    expect(response).to include('test path')
  end

  it "render exception message" do
    expect(response).to include('ex message')
  end
end
