require_relative './command'

module Commands
  class Clear < Command

    SYNONYMS = ['clear']

    def self.synonyms
      SYNONYMS
    end

    def execute
      repl.calculator.reset
    end

  end
end