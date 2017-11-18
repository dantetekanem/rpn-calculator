# RPN (Reverse Polish Notation) Calculator

More info about the RPN: https://en.wikipedia.org/wiki/Reverse_Polish_notation

This project has no dependecies, therefore it requires bundler and rspec to run the tests.

---

A CLI (Command Line Interface) to execute RPN, it can receive one or multiple arguments through lexical analysis and simulate a real calculator. Also includes a library `RpnCalculator.rb` to execute the code standalone.

---

This software is used as clean as possible, so it doesn't requires any dependecy to run (like CLI gems such as Thor, YYT and others). It uses a clean syntax and a bin command to execute. The LexicalAnalyzer.rb lib is responsible for reading the expressions and translating to acceptable tokens.
You also can add new expressions by adding a new Token and letting LexicalAnalyzer.rb knowing about this new expression.

---

### How to run
Clone this project and run: `./bin/rpn`, if necessary applies the `chmod -x bin/rpn` permissions to the executable.
Type `help` for more information:

```
  - total -> shows the accumulated value for the expressions
  - clear -> clean the stack and reset the accumulated value
  - stack -> shows the current stack for the expressions
  - any number -> adds a number to the expression
  - operator (+ - * / %) -> adds an operator and executes the current stack
  - any number + operator -> adds a number to the expression and executes the current stack
  - exit or q -> terminates the program
```
Using `Ctrl + C` also terminates the program.

### Tests
Install bundler: `gem install bundler` and run `bundle install`, after this run: `rspec`.

### Technical decisions
This is a project created for fun and analysis of my development quality.
I tried to use the SOLID principles in this project, and isolated the libraries so it was easier to run. Also, the RpnCalculator.rb library is focused to run standalone, so you can execute expressions as singleton method, such as: `RpnCalculator.execute('1 2 3 + +')`.
The CLI is just one of multiple possible interfaces to execute this library. It's also very easy to add a new expression and improve the calculator.
