module Commands
  class Quit

    SYNONYMS = ['quit', 'exit', 'q', nil]

    def self.keys
      SYNONYMS
    end

    def execute(repl = nil)
      repl.notice $language.misc.bye
      repl.quit
    end

  end
end