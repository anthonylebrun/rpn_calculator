OperatorError = Class.new(StandardError)

class Operator

  private

  def argument_error
    raise OperatorError, $language.errors.wrong_arguments_number
  end

end