require_relative "rpn_calculator"

class Cli
  attr_reader :rpn
  OPERATORS = ["+", "-", "/", "*", "%"].freeze

  def initialize
    @rpn = RpnCalculator.new("")

    welcome_message
    play_loop
  end

  def play_loop
    loop do
      print "> "
      begin
        command = gets.chomp
      rescue Interrupt, SystemExit
        byebye_message
        break
      end

      case command
      when "exit" then break
      when "q" then break
      when "help" then help_message
      when "total" then total_message
      when "clear" then clear_message
      when "stack" then stack_message
      else add(command)
      end
    end
  end

  def add(command)
    rpn.add(command)

    last_token = rpn.tokens.last
    if last_token.is_a?(OperatorToken)
      rpn.execute
      puts rpn.tokens.last.value
    elsif last_token.is_a?(OperandToken)
      puts last_token.value
    end
  end

  # Messages

  def welcome_message
    puts "RPN (Reverse Polish Notation) by Leonardo Pereira (contato@leonardopereira.com) - version 1.0"
    puts "--- Run 'help' for more information. Ctrl + C to terminate."
    puts "\n"
  end

  def help_message
    puts "- total -> shows the accumulated value for the expressions"
    puts "- clear -> clean the stack and reset the accumulated value"
    puts "- stack -> shows the current stack for the expressions"
    puts "- any number -> adds a number to the expression"
    puts "- operator (+ - * / %) -> adds an operator and executes the current stack"
    puts "- any number + operator -> adds a number to the expression and executes the current stack"
    puts "- exit or q -> terminates the program"
  end

  def total_message
    puts "Total: #{rpn.accumulated}"
  end

  def clear_message
    rpn.clear
    puts rpn.accumulated
  end

  def stack_message
    puts rpn.stack.inspect
  end
end
