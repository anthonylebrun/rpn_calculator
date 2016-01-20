module Commands
  class AddPi

    SYNONYMS = ['pi']

    def self.keys
      SYNONYMS
    end

    def execute(repl = nil)
      repl.calculator.add_value(Math::PI)
    end

  end
end