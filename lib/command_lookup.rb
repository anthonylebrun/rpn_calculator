require_relative './abstract_factory'
require_relative './factory_search'
require_relative './commands/index'

# Finds a command from the commands directory
# Returns nil if none found

class CommandLookup
  include AbstractFactory.new(Commands)
  include FactorySearch
end