require_relative './operator'

module Operators
  class Division < Operator

    SYMBOLS = ['/']
    NUMBER_OF_ARGUMENTS = 2

    def self.keys
      SYMBOLS
    end

    def run(*args)
      argument_error if args.size != number_of_arguments
      args.inject{ |quotient, x| quotient / x }
    end

    def number_of_arguments
      NUMBER_OF_ARGUMENTS
    end

  end
end