class DivisionOperatorToken < OperatorToken
  def run(operand_1, operand_2)
    OperandToken.new(operand_1 / operand_2)
  end

  def self.expression
    /^\//
  end
end
