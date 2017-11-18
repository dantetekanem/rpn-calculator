class OperandToken
  attr_reader :value

  def initialize(value)
    @value = value.to_f
  end
end

class OperatorToken
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def run(operand_1, operand_2)
    case value
    when "+" then operand_1 + operand_2
    when "-" then operand_1 - operand_2
    when "*" then operand_1 * operand_2
    when "/" then operand_1 / operand_2
    end
  end
end

class IgnoreToken; end

class LexicalAnalyzer
  DEFINITIONS = [
    [/^[-]?[0-9]*\.?[0-9]+/, OperandToken],
    [/^\+/, OperatorToken],
    [/^\-/, OperatorToken],
    [/^\*/, OperatorToken],
    [/^\//, OperatorToken],
    [/\s+/, IgnoreToken]
  ].freeze

  def self.tokenize(expression)
    tokens = []
    last_size = 0

    while expression.size != last_size
      last_size = expression.size
      DEFINITIONS.each do |regex, token_type|
        lexical = expression.slice!(regex)
        if lexical
          tokens << token_type.new(lexical) unless token_type == IgnoreToken
          break
        end
      end
    end

    tokens
  end
end
