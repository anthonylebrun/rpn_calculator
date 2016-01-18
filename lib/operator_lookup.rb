require_relative './abstract_factory'
require_relative './operators/index'

# Finds an operator from the operators directory
# Returns nil if none found

class OperatorLookup

  include AbstractFactory.new(Operators)

  attr_reader :result

  def initialize(symbol)
    @result = find_by_symbol(symbol)
  end

  private

  def find_by_symbol(symbol)
    operator = all_operators.find do |operator|
      operator.symbols.include?(symbol)
    end

    operator && operator.new
  end

  def all_operators
    concrete_factories
  end

end