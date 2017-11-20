require_relative "lexical_analyzer"

class RpnCalculator
  attr_reader :tokens, :accumulated

  def initialize
    @tokens = []
    @accumulated = 0.0
  end

  def self.execute(expression)
    new.tap do |e|
      e.add(expression)
      e.execute
    end.accumulated
  end

  def execute
    operation_stack = []

    tokens.each do |token|
      if token.is_a? OperandToken
        operation_stack << token
      else
        # Is an operator (duck typing here)
        operand_2 = operation_stack.pop
        operand_1 = operation_stack.pop

        result = token.run(operand_1.value, operand_2.value)
        operation_stack << result
      end
    end

    @accumulated = operation_stack[0].value
    @tokens = operation_stack
  end

  def add(expression)
    @tokens += LexicalAnalyzer.tokenize(expression)
  end

  def clear
    @tokens = []
    @accumulated = 0.0
  end

  def stack
    tokens.map(&:value)
  end
end
