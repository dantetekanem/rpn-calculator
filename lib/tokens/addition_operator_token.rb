class AdditionOperatorToken < OperatorToken
  def run(operand_1, operand_2)
    operand_1 + operand_2
  end

  def self.expression
    /^\+/
  end
end
