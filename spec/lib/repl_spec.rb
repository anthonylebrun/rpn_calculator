require 'stringio'
require_relative '../../lib/repl'

describe REPL do
  before :each do
    @calculator = double('calculator')
    allow(@calculator).to receive(:add_value)
    allow(@calculator).to receive(:run_operator)

    @repl = REPL.new(@calculator)
  end

  describe "#initialize" do
    it "should assign a calculator to the REPL" do
      expect(@repl.calculator).to be(@calculator)
    end
  end

  describe "#listen!" do
    let(:user_input) { '4' }

    it "should get and process input from the user" do
      allow(@repl).to receive(:gets) { user_input }
      expect(@repl).to receive(:handle_input).with(user_input)
      @repl.listen!
    end
  end

  describe "#quit" do
    it "should exit" do
      lambda do
        allow(object).to receive(:exit)
        expect(object).to receive(:exit)
        @repl.quit
      end
    end
  end

  describe "#result" do
    it "should call the MessagePrinter" do
      expect(MessagePrinter).to receive(:success)
      @repl.result(10)
    end
  end

  describe "#notice" do
    it "should call the MessagePrinter" do
      expect(MessagePrinter).to receive(:notice)
      @repl.notice('notice')

    end
  end

  describe "#error" do
    it "should call the MessagePrinter" do
      expect(MessagePrinter).to receive(:error)
      @repl.error('error')
    end
  end
end