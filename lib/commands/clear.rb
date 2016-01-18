module Commands
  class Clear

    SYNONYMS = ['clear']

    def self.synonyms
      SYNONYMS
    end

    def execute(repl = nil)
      repl.calculator.reset
    end

  end
end