require_relative './command'

module Commands
  class Help < Command

    SYNONYMS = ['help']

    def self.synonyms
      SYNONYMS
    end

    def execute
      repl.notice $language.help.usage.light_blue
      repl.notice $language.help.learn.light_blue
      repl.notice $language.help.commands.light_blue
    end

  end
end