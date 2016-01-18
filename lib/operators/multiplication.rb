require_relative './operator'

module Operators
  class Multiplication < Operator

    SYMBOLS = ['*']
    NUMBER_OF_ARGUMENTS = 2

    def self.symbols
      SYMBOLS
    end

    def run(*args)
      argument_error if args.size != number_of_arguments
      args.inject{ |product, x| product * x }
    end

    def number_of_arguments
      NUMBER_OF_ARGUMENTS
    end

  end
end