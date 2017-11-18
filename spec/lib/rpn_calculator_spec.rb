require_relative "../../lib/rpn_calculator"

RSpec.describe RpnCalculator do
  subject(:rpn) { described_class.new('') }
  before { subject.add('5 2 +') }

  it "stack should contains 3 tokens" do
    expect(subject.stack.size).to eq 3
  end

  it "when executing, should still have one token" do
    subject.execute
    expect(subject.stack).to eq [7]
    expect(subject.accumulated).to eq 7
  end

  it "can add new expressions" do
    subject.add('2 -')

    expect(subject.stack.size).to eq 5
  end

  it "can add new expressions and calculate results" do
    subject.add('2 -')
    subject.execute

    expect(subject.stack).to eq [5]
    expect(subject.accumulated).to eq 5
  end

  it "can clear the stack" do
    expect(subject.stack).to_not eq []
    subject.clear

    expect(subject.stack).to eq []
  end

  it "can run complex calculations" do
    subject.clear
    subject.add('15 7 1 1 + - / 3 * 2 1 1 + + -')
    subject.execute

    expect(subject.accumulated).to eq 5
  end
end
