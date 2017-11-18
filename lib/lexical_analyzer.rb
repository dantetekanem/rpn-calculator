require_relative "tokens/operand_token"
require_relative "tokens/operator_token"
require_relative "tokens/addition_operator_token"
require_relative "tokens/substraction_operator_token"
require_relative "tokens/multiplication_operator_token"
require_relative "tokens/division_operator_token"
require_relative "tokens/ignore_token"

class LexicalAnalyzer
  DEFINITIONS = [
    [/^[-]?[0-9]*\.?[0-9]+/, OperandToken],
    [/^\+/, AdditionOperatorToken],
    [/^\-/, SubstractionOperatorToken],
    [/^\*/, MultiplicationOperatorToken],
    [/^\//, DivisionOperatorToken],
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
