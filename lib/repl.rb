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

  def quit
    exit
  end

  def result(result)
    MessagePrinter.success("%g" % result) if result
  end

  def notice(message)
    MessagePrinter.notice(message)
  end

  def error(message)
    MessagePrinter.error(message)
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
      error($language.errors.invalid_input)
    end

    listen!
  end

  def handle_number(value)
    result calculator.add_value(value)
  end

  def handle_operator(operator)
    begin
      result calculator.run_operator(operator)
    rescue OperatorError => e
      error e.message
    end
  end

  def handle_command(command)
    result command.execute
  end

end