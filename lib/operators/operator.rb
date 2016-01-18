require_relative '../exceptions'

class Operator

  private

  def argument_error
    raise OperatorError, $language.errors.wrong_arguments_number
  end

end