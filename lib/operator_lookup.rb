require_relative './abstract_factory'
require_relative './factory_search'
require_relative './operators/index'

# Finds an operator from the operators directory
# Returns nil if none found

class OperatorLookup
  include AbstractFactory.new(Operators)
  include FactorySearch
end