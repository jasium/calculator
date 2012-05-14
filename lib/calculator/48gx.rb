
require 'output'
require 'operator_bank'
module Calculator
  class HP48GX

    attr_accessor :stack, :out

    def initialize(output)
#      warn "#{self} created by #{caller[0..2]}"
      @out = output
      @opbank ||= OperatorBank.new
      @opbank.load_from_dir(Dir.pwd + '/lib/calculator/operators')
      @stack = Array.new
    end

    def push(arg)
      @stack.push(arg) unless arg.nil?
    end

    def start
      @out.puts "> "
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
      if is_operand(line)
        @stack.push Float(line)
      elsif is_operator(line)
        handle_operator(line)
      else
        raise "invalid input: #{line}"
      end
    end

    def is_operator(token)
      @opbank.include? token
    end

    def is_operand(token)
      token =~ /\d+(\.\d+)?/
    end

    def handle_operator(op)
      operator = @opbank.get_operator(op)
      push(operator.compute(@stack))
    end
  end
end