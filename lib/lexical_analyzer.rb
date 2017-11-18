require_relative "tokens/operand_token"
require_relative "tokens/operator_token"
require_relative "tokens/addition_operator_token"
require_relative "tokens/substraction_operator_token"
require_relative "tokens/multiplication_operator_token"
require_relative "tokens/division_operator_token"
require_relative "tokens/mod_operator_token"
require_relative "tokens/pow_operator_token"
require_relative "tokens/ignore_token"

class LexicalAnalyzer
  TOKENS = [
    OperandToken,
    AdditionOperatorToken,
    SubstractionOperatorToken,
    PowOperatorToken,
    MultiplicationOperatorToken,
    DivisionOperatorToken,
    ModOperatorToken,
    IgnoreToken
  ].freeze

  def self.tokenize(expression)
    tokens = []
    last_size = 0

    while expression.size != last_size
      last_size = expression.size
      TOKENS.each do |token_type|
        lexical = expression.slice!(token_type.expression)
        if lexical
          tokens << token_type.new(lexical) unless token_type == IgnoreToken
          break
        end
      end
    end

    tokens
  end
end
