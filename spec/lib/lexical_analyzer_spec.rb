require_relative "../../lib/lexical_analyzer"

RSpec.describe LexicalAnalyzer do
  subject(:lexical_analyzer) { described_class }

  it "can tokenize expressions" do
    tokens = subject.tokenize('5 2 +')

    expect(tokens.size).to eq 3
    expect(tokens[0]).to be_a(OperandToken)
    expect(tokens[1]).to be_a(OperandToken)
    expect(tokens[2]).to be_a(AdditionOperatorToken)
  end

  it "only tokenize allowed expressions" do
    tokens = subject.tokenize('1 2 * oops')

    expect(tokens.size).to eq 3
    expect(tokens[0]).to be_a(OperandToken)
    expect(tokens[1]).to be_a(OperandToken)
    expect(tokens[2]).to be_a(MultiplicationOperatorToken)
  end
end
