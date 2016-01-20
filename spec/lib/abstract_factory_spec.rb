require_relative '../../lib/abstract_factory'

describe AbstractFactory do

  before :each do
    @abstract_factory = AbstractFactory.new(Module.new)
  end

  describe "#initialize" do
    it "should return a module" do
      expect(@abstract_factory).to be_a(Module)
    end
  end

  context "when included" do
    it "should define the concrete_factories method" do
      Klass = Class.new.include @abstract_factory
      expect(Klass.new).to respond_to(:concrete_factories)
    end
  end

end