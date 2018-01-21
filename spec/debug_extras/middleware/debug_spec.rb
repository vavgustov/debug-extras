require "spec_helper"

RSpec.describe DebugExtras::Debug do
  let(:app) { DebugExtras::Debug.new(->env { "test app" }) }
  let(:exception_to_pass) { RuntimeError.new("something wrong") }
  let(:exception_to_handle) { DebugExtras::DebugData.new("something wrong") }

  it "passes non-error responses" do
    expect(app.call({})).to eq("test app")
  end

  it "reset $debug_extras_add_styles variable" do
    $debug_extras_add_styles = true
    app.call({})
    expect($debug_extras_add_styles).to be false
  end

  it "reset $debug_extras_add_styles variable" do
    $debug_extras_messages = ['message']
    app.call({})
    expect($debug_extras_messages).to be_empty
  end

  context "when exception raised" do
    context "by DebugExtras::DebugData" do
      let(:app) { DebugExtras::Debug.new(->env { raise exception_to_handle }) }

      it "redner page with data" do
        status, headers, body = app.call({})
        expect(body[0]).to include("something wrong")
      end
    end

    context "by other class" do
      let(:app) { DebugExtras::Debug.new(->env { raise exception_to_pass }) }

      it "raise error" do
        expect { app.call({}) }.to raise_error("something wrong")
      end
    end
  end
end
