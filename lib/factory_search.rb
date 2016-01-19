# Allows filtering of concrete_factories provided by
# the AbstractFactory module

# Usage:
#
# class Foo
#   include AbstractFactory.new(FactoryWrapperModule)
#   include FactorySearch
# end

module FactorySearch

  attr_reader :result

  def initialize(query)
    @result = find_by_key(query)
  end

  private

  def find_by_key(query)
    factory = all_factories.find do |factory|
      factory.keys.include?(query)
    end

    factory && factory.new
  end

  def all_factories
    concrete_factories
  end

end