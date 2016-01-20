require_relative '../../lib/command_lookup'

describe CommandLookup do
  describe "#initialize" do
    before :all do
      module Commands
        class Foo
          def self.keys; ['foo']; end
        end
      end
    end

    it "should return a matching class from the Commands module" do
      command_lookup = CommandLookup.new('foo')
      expect(command_lookup.result).to be_a(Commands::Foo)
    end

    it "should return be falsy if no matches are found" do
      command_lookup = CommandLookup.new('bar')
      expect(command_lookup.result).to be_falsy
    end
  end
end