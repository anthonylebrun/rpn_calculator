require_relative './abstract_factory'
require_relative './factory_search'
require_relative './operators/index'

# Finds an operator from the operators directory
# Returns nil if none found

class OperatorLookup
  
  include AbstractFactory.new(Operators)
  include FactorySearch

  attr_reader :result

  def initialize(query)
    @result = find_by_key(query)
  end

end