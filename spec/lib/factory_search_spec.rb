require_relative '../../lib/factory_search'

describe FactorySearch do
  context "when included" do
    before :all do
      Klass = Class.new.include FactorySearch
    end

    it "should define the instance method find_by_key on its class" do
      expect(Klass.new).to respond_to(:find_by_key)
    end
  end
end