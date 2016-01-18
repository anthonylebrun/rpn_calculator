require_relative './abstract_factory'
require_relative './commands/index'

# Finds a command from the commands directory
# Returns nil if none found

class CommandLookup

  include AbstractFactory.new(Commands)

  attr_reader :result

  def initialize(repl, name)
    @repl = repl
    @result = find_by_name(name)
  end

  private

  attr_reader :repl

  def find_by_name(name)
    command = all_commands.find do |command|
      command.synonyms.include?(name)
    end

    command && command.new(repl)
  end

  def all_commands
    concrete_factories
  end

end