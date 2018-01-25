require "spec_helper"

RSpec.describe DebugExtras::ActionController do
  let(:headers) { { "Content-Type" => "text/html" } }
  let(:body) { "<html><head></head><body><h1>HTML content</h1></body></html>" }
  let(:response_mock) do
    Class.new do
      attr_accessor :body
      attr_reader :headers

      def initialize(headers, body)
        @headers = headers
        @body = body
      end
    end
  end
  let(:base_super_mock) do
    Class.new do
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def render; end
    end
  end
  let(:action_controller_mock) do
    Class.new(base_super_mock) do
      include DebugExtras::ActionController
    end
  end

  before do
    response = response_mock.new(headers, body)
    @controller = action_controller_mock.new(response)
  end

  context "when message exists" do
    before { $debug_extras_messages = ["message"] }

    it "inject message to response body" do
      @controller.render
      expect(@controller.response.body).to include("message")
    end
  end

  context "when message not exists" do
    before do
      $debug_extras_add_styles = false
      $debug_extras_messages = []
    end

    it "bypass response body" do
      @controller.render
      expect(@controller.response.body).to eq(body)
    end
  end
end
