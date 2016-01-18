require_relative '../lib/calculator'
require_relative '../lib/repl'

# Let's get it started!
# Let's get it started in here!

calculator = Calculator.new
repl = REPL.new(calculator)
repl.listen!