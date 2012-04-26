
require 'output'
module Calculator
  class HP48GX

    attr_accessor :stack, :out

    def initialize(output)
      @out = output
      self.stack = Array.new
      @operators = ['+','-', '*','/','sqrt', 'neg', 'swp','!', 'rot', 'rotd']
    end

    def push(arg)
      @stack.push(arg)
    end

    def start
      @out.puts "> "
    end

    def swap
      raise "Insufficient items on stack" if @stack.size < 2
      t = @stack.pop(2).reverse
      t.each {|n| @stack.push(n)}
    end

    def rot
      raise "Insufficient items on stack" if @stack.size < 2
      @stack.push(@stack.shift)
    end

    def do_rotd
      raise "Insufficient items on stack" if @stack.size < 2
      @stack.unshift(@stack.pop)
    end

    def pop
      @stack.pop
    end

    def top
      @stack[@stack.size-1]
    end

    def top2
      @stack.slice(-2)
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
      elsif op == "swp" then
        swap
      elsif op == "rot" then
        rot
      elsif op == "rotd" then
        do_rotd
      elsif op == "!" then
        @stack.push(do_factorial)
      end
    end

    #def do_factorial
    #  var1 = @stack.pop
    #  if (0 == var1 - var1.floor)
    #    (1..var1).inject(:*)
    #  else
    #    raise "Factorial only valid against integers"
    #  end
    #end

    def do_factorial
      var1 = top
      raise "Factorial only valid against positive integers" unless (0 == var1 - var1.floor)
      raise "Factorial only valid against positive integers" unless (var1 > 1)
      var1 = @stack.pop
      (1..var1).inject(:*)
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