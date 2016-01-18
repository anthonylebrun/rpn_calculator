require_relative './command'

module Commands
  class Help < Command

    SYNONYMS = ['help']

    def self.synonyms
      SYNONYMS
    end

    def execute
      puts $language.help.usage.light_blue
      puts $language.help.learn.light_blue
      puts $language.help.commands.light_blue
    end

  end
end