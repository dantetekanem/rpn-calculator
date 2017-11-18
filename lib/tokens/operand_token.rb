class OperandToken
  attr_reader :value

  def initialize(value)
    @value = value.to_f
  end

  def self.expression
    /^[-]?[0-9]*\.?[0-9]+/
  end
end
