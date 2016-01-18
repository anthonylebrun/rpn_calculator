require_relative './command'

module Commands
  class AddPi < Command

    SYNONYMS = ['pi']

    def self.synonyms
      SYNONYMS
    end

    def execute
      repl.calculator.add_value(Math::PI)
    end

  end
end