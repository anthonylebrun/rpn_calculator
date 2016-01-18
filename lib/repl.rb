require_relative './input'
require_relative './operator_lookup'
require_relative './command_lookup'
require_relative './language'
require_relative './message_printer'
require_relative './exceptions'

# Well, it's a REPL! Handles inputs and printing, repeatedly.

class REPL

  attr_reader :calculator

  def initialize(calculator)
    @calculator = calculator
  end

  def listen!
    print '> '
    handle_input(gets)
  end

  private

  def handle_input(raw_input)
    input = Input.new(raw_input)

    if input.is_numerical?
      handle_number(input.value)
    elsif operator = OperatorLookup.new(input.value).result
      handle_operator(operator)
    elsif command = CommandLookup.new(self, input.value).result
      handle_command(command)
    else
      print_error($language.errors.invalid_input)
    end

    listen!
  end

  def handle_number(value)
    print_result calculator.add_value(value)
  end

  def handle_operator(operator)
    begin
      print_result calculator.run_operator(operator)
    rescue OperatorError, CalculatorError => e
      print_error(e.message)
    end
  end

  def handle_command(command)
    command.execute
  end

  def print_result(result)
    MessagePrinter.success("%g" % result)
  end

  def print_error(message)
    MessagePrinter.error(message)
  end

end