require_relative '../../lib/operator_lookup'

describe OperatorLookup do

  describe "#initialize" do

    before :all do
      module Operators
        class Foo
          def self.keys; ['foo']; end
        end
      end
    end

    it "should return a matching class from the Operators module" do
      command_lookup = OperatorLookup.new('foo')
      expect(command_lookup.result).to be_a(Operators::Foo)
    end

    it "should return be falsy if no matches are found" do
      command_lookup = OperatorLookup.new('bar')
      expect(command_lookup.result).to be_falsy
    end

  end

end