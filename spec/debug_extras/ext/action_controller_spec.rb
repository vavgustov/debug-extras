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

  let(:controller_mock) do
    Class.new do
      class_attribute :callback
      attr_accessor :response

      def self.after_action(name)
        self.callback = name
      end

      include DebugExtras::ActionController

      def initialize(response)
        @response = response
        send callback
      end
    end
  end

  before do
    @response = response_mock.new(headers, body)
  end

  context "when message exists" do
    before do
      $debug_extras_messages = ["message"]
      @controller = controller_mock.new(@response)
    end

    it "inject message to response body" do
      expect(@controller.response.body).to include("message")
    end
  end

  context "when message not exists" do
    before do
      $debug_extras_add_styles = false
      $debug_extras_messages = []
      @controller = controller_mock.new(@response)
    end

    it "bypass response body" do
      expect(@controller.response.body).to eq(body)
    end
  end
end
