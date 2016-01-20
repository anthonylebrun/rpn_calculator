require 'colorize'

# Semantic wrapper for printing colorful messages

# Usage:
#
# MessagePrinter.success("You win!")

module MessagePrinter

  def self.success(message)
    puts MessageColorer.new(message).success
  end

  def self.error(message)
    puts MessageColorer.new(message).error
  end

  def self.notice(message)
    puts MessageColorer.new(message).notice
  end

  class MessageColorer

    attr_reader :message

    def initialize(message)
      @message = message.to_s
    end

    def success
      message.light_green
    end

    def error
      message.light_red
    end

    def notice
      message.light_blue
    end

  end

end