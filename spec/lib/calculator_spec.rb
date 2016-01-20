require_relative '../../lib/calculator'

describe Calculator do
  before :each do
    @calculator = Calculator.new
  end

  context "creation" do
    describe "#initialize" do
      it "should define an empty stack" do
        expect(@calculator.stack).to be_empty
      end
    end
  end

  context "mutation" do
    let(:stack) { [1, 2, 3] }

    before :each do
      @calculator.stack = stack.dup
    end

    describe "#run_operator" do
      let(:n_operator_args) { 2 }
      let(:result) { 5 }
      let(:stack_after) { [1, result]}

      before :each do
        @addition = double('operator')
        allow(@addition).to receive(:number_of_arguments) { n_operator_args }
        allow(@addition).to receive(:run) { result }
      end

      it "should remove (number of operator arguments - 1) values from the stack" do
        @calculator.run_operator(@addition)
        expect(@calculator.stack.size).to eq(stack.size - (n_operator_args - 1))
      end

      it "should add the result to the stack" do
        @calculator.run_operator(@addition)
        expect(@calculator.stack).to eq(stack_after)
      end
    end

    describe "#add_value" do
      let(:value) { 5 }
      let(:stack_after) { stack + [value] }

      it "should add a value to the stack" do
        @calculator.add_value(value)
        expect(@calculator.stack).to eq(stack_after)
      end

      it "should return the value passed in" do
        expect(@calculator.add_value(value)).to eq(value)
      end
    end

    describe "#reset" do
      it "should clear the stack" do
        @calculator.reset
        expect(@calculator.stack).to eq([])
      end

      it "should return something falsy" do
        expect(@calculator.reset).to be_falsy
      end
    end
  end
end