require "spec_helper"

RSpec.describe DebugExtras::ActionController do
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

  it "render message" do
    $debug_extras_messages = ['message']
    response = response_mock.new({ "Content-Type" => "text/html" }, "<html><head></head><body><h1>HTML content</h1></body></html>")
    controller = action_controller_mock.new(response)
    controller.render
    expect(controller.response.body).to include('message')
  end
end
