# Allows filtering of concrete_factories provided by
# the AbstractFactory module. It expects the class to
# have a concrete_factories method defined.

# Usage:
#
# class Foo
#   include AbstractFactory.new(FactoryWrapperModule)
#   include FactorySearch
#
#   def foo(key)
#     find_by_key(key)
#   end
# end

module FactorySearch

  def find_by_key(query)
    factory = all_factories.find do |factory|
      factory.keys.include?(query)
    end

    factory && factory.new
  end

  private

  def all_factories
    concrete_factories
  end

end