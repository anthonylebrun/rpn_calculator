require_relative './command'
require_relative '../message_printer'

module Commands
  class Quit < Command

    SYNONYMS = ['quit', 'exit', 'q', nil]

    def self.synonyms
      SYNONYMS
    end

    def execute
      repl.notice $language.misc.bye
      repl.quit
    end

  end
end