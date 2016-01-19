# The RPN calculator part :)

# If a method adds to the sack, it should
# return that value, otherwise it should
# return nil

class Calculator

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def run_operator(operator)
    op_args = stack.last(operator.number_of_arguments)
    result = operator.run(*op_args)

    # If the operator runs without raising exceptions
    remove_values(operator.number_of_arguments)
    add_value(result)
  end

  def add_value(value)
    stack.push(value)
    value
  end

  def reset
    stack.clear
    nil
  end

  private

  def remove_values(n)
    stack.pop(n)
  end

end