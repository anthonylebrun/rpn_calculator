require 'colorize'

# Semantic wrapper for printing colorful messages

# Usage:
#
# MessagePrinter.success("You win!")

module MessagePrinter

  def self.success(message)
    puts message.to_s.light_green
  end

  def self.error(message)
    puts message.to_s.light_red
  end

  def self.notice(message)
    puts message.to_s.light_blue
  end

end