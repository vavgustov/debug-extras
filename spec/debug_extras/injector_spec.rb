require "spec_helper"

RSpec.describe DebugExtras::Injector do
  let(:html_valid) { "<html><head></head><body class='test-class'><h1>HTML content</h1></body></html>" }
  let(:html_invalid) { "<html><head></head><h1>HTML content</h1>body/></html>" }
  let(:type_supported) { { "Content-Type" => "text/html" } }
  let(:type_unsupported) { { "Content-Type" => "application/json" } }

  let(:response_with_unsupported_content_type) do
    response = double("Response")
    allow(response).to receive(:headers).and_return(type_unsupported)
    allow(response).to receive(:body).and_return(html_valid)
    response
  end

  let(:response_with_invalid_html) do
    response = double("Response")
    allow(response).to receive(:headers).and_return(type_supported)
    allow(response).to receive(:body).and_return(html_invalid)
    response
  end

  let(:response_valid) do
    response = double("Response")
    allow(response).to receive(:headers).and_return(type_supported)
    allow(response).to receive(:body).and_return(html_valid)
    response
  end

  context "when message exists" do
    before do
      $debug_extras_messages = ["message"]
    end

    context "when response not valid for processing" do
      it "bypass response with not supported content-type" do
        injector = DebugExtras::Injector.new(response_with_unsupported_content_type)
        expect(injector.process_response).to eq(html_valid)
      end

      it "bypass response with invalid HTML" do
        injector = DebugExtras::Injector.new(response_with_invalid_html)
        expect(injector.process_response).to eq(html_invalid)
      end
    end

    it "add messages to response" do
      injector = DebugExtras::Injector.new(response_valid)
      expect(injector.process_response).to include("message")
    end

    it "add styles to response" do
      injector = DebugExtras::Injector.new(response_valid)
      expect(injector.process_response).to include("<!-- styles injected by debug-extras gem -->")
    end
  end

  context "when style exists" do
    before do
      $debug_extras_messages = []
      $debug_extras_add_styles = true
    end

    it "add styles to response" do
      injector = DebugExtras::Injector.new(response_valid)
      expect(injector.process_response).to include("<!-- styles injected by debug-extras gem -->")
    end
  end

  context "when message and styles not exists" do
    before do
      $debug_extras_messages = []
      $debug_extras_add_styles = false
    end

    it "bypass response" do
      injector = DebugExtras::Injector.new(response_valid)
      expect(injector.process_response).to eq(html_valid)
    end
  end
end
