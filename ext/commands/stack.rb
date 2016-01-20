module Commands
  class Stack

    SYNONYMS = ['stack']

    def self.keys
      SYNONYMS
    end

    def execute(repl = nil)
      repl.notice(repl.calculator.stack)
    end

  end
end