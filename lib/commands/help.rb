module Commands
  class Help

    SYNONYMS = ['help']

    def self.synonyms
      SYNONYMS
    end

    def execute(repl = nil)
      repl.notice $language.help.usage.light_blue
      repl.notice $language.help.learn.light_blue
      repl.notice $language.help.commands.light_blue
    end

  end
end