require_relative "lexical_analyzer"

class RpnCalculator
  attr_reader :tokens, :accumulated

  def initialize(expression)
    @tokens = LexicalAnalyzer.tokenize(expression)
    @accumulated = 0.0
  end

  def self.execute(expression)
    new(expression).execute
  end

  def execute
    stack = []

    tokens.each do |token|
      if token.is_a? OperatorToken
        operand_2 = stack.pop
        operand_1 = stack.pop

        result = token.run(operand_1, operand_2)
        stack << result
      elsif token.is_a? OperandToken
        stack << token.value
      end
    end

    @accumulated = stack[0]
    @tokens = LexicalAnalyzer.tokenize(stack.join(' '))
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
