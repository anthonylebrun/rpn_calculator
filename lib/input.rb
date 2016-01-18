require 'values'

# Does Basic user input formatting and type
# conversion if value is a number.

class Input < Value.new(:raw)

  def initialize(raw)
    @value = reformat(raw)
  end

  def value
    Float(@value) rescue @value
  end

  def is_numerical?
    value.is_a? Numeric
  end

  private

  def reformat(raw)
    raw && raw.strip
  end

end