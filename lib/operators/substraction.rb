require_relative './operator'

module Operators
  class Substraction < Operator

    SYMBOLS = ['-']
    NUMBER_OF_ARGUMENTS = 2

    def self.symbols
      SYMBOLS
    end

    def run(*args)
      argument_error if args.size != number_of_arguments
      args.inject{ |difference, x| difference - x }
    end

    def number_of_arguments
      NUMBER_OF_ARGUMENTS
    end

  end
end