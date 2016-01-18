module Commands
  class Quit

    SYNONYMS = ['quit', 'exit', 'q', nil]

    def self.synonyms
      SYNONYMS
    end

    def execute(repl = nil)
      repl.notice $language.misc.bye
      repl.quit
    end

  end
end