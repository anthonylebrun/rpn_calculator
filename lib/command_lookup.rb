require_relative './abstract_factory'
require_relative './factory_search'
require_relative '../ext/commands/index'

# Finds a command from the commands directory
# Returns nil if none found

class CommandLookup
  
  include AbstractFactory.new(Commands)
  include FactorySearch

  attr_reader :result

  def initialize(query)
    @result = find_by_key(query)
  end

end