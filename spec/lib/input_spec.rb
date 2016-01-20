require_relative '../../lib/input'

describe Input do
  let(:number) { '-124.921' }
  let(:non_number) { 'FooBar' }
  let(:junky_number) { "  #{number}\n" }
  let(:command) { "quit" }

  describe "#initialize" do
    it "should strip extraneous whitespace and newlines" do
      input = Input.new(junky_number)
      expect(input.instance_variable_get(:@value)).to eq(number)
    end
  end

  describe "#value" do
    it "should return a float of the value if the value is a number" do
      input = Input.new(number)
      expect(input.value).to eq(number.to_f)
    end

    it "should return the original value if the value is not a number" do
      input = Input.new(non_number)
      expect(input.value).to eq(non_number)
    end
  end

  describe "#is_numerical?" do
    it "should return true if value is a number" do
      input = Input.new(number)
      expect(input.is_numerical?).to be(true)
    end

    it "should return false if value is not a number" do
      input = Input.new(non_number)
      expect(input.is_numerical?).to be(false)
    end
  end
end