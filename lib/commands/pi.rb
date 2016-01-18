module Commands
  class AddPi

    SYNONYMS = ['pi']

    def self.synonyms
      SYNONYMS
    end

    def execute(repl = nil)
      repl.calculator.add_value(Math::PI)
    end

  end
end