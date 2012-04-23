
require 'output'
module Calculator
  class HP48GX

    attr_accessor :stack, :out

    def initialize(output)
      @out = output
      self.stack = Array.new
      @operators = ['+','-', '*','/','sqrt', 'neg']
    end

    def push(arg)
      @stack.push(arg)
    end

    def start
      @out.puts "> "
    end

    def swap
      @stack.push((@stack.pop(2)).reverse)
    end

    def pop
      #if @stack.empty?
      #  @output.puts "Can't pop empty stack"
      #  raise IndexError, "Can't pop empty stack"
      #else
      @stack.pop
      #end
    end

    def top
      #if @stack.empty?
      #  @output.puts "Stack empty"
      #  raise IndexError, "stack is empty"
      #else
      @stack[@stack.size-1]
      #end
    end

    def top2nd
      @stack[@stack.size-2]
    end
    def handle_input(line)
      line.chomp!
#      p line
#      p @stack
      if is_operand(line)
        @stack.push Float(line)
      elsif is_operator(line)
        handle_operator(line)
      elsif is_function(line)
        handle_function(line)
      else
        warn "invalid input: #{line}"
      end
    end

    def is_operator(token)
      @operators.include? token
    end
    def is_operand(token)
      token =~ /\d+(\.\d+)?/
    end
    def is_function(token)
      false
    end

    def handle_operator(op)
#      puts "before operator"
#      p @stack
      if op == "+" then
        @stack.push(do_plus)
      elsif op == "-" then
        @stack.push(do_minus)
      elsif op == "*" then
        @stack.push(do_times)
      elsif op == "/" then
        @stack.push(do_div)
      elsif op == "sqrt" then
        @stack.push(do_sqrt)
      elsif op == "neg" then
        @stack.push(do_neg)
      end
#      puts "after operator"
#      p @stack
    end

    def do_plus
      var1 = @stack.pop
      var2 = @stack.pop
      var2 + var1
    end
    def do_minus
      var1 = @stack.pop
      var2 = @stack.pop
      var2 - var1
    end
    def do_times
      var1 = @stack.pop
      var2 = @stack.pop
      var2 * var1
    end
    def do_div
      var1 = @stack.pop
      var2 = @stack.pop
      var2 / var1
    end
    def do_sqrt
      Math.sqrt(@stack.pop)
    end
    def do_neg
      0 - @stack.pop
    end
  end
end