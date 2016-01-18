require_relative '../exceptions'

module Operators
  class Division

    SYMBOLS = ['/']
    NUMBER_OF_ARGUMENTS = 2

    def self.symbols
      SYMBOLS
    end

    def run(*args)
      argument_error if args.size != number_of_arguments
      args.inject{ |quotient, x| quotient / x }
    end

    def number_of_arguments
      NUMBER_OF_ARGUMENTS
    end

    private

    def argument_error
      raise OperatorError, $language.errors.wrong_arguments_number
    end

  end
end