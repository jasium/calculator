
require 'output'
require 'operator_factory'
module Calculator
  class HP48GX

    attr_accessor :stack, :out

    def initialize(output)
      @out = output
      @opfactory = OperatorFactory.new(Dir.pwd + '/lib/calculator/operators')
      self.stack = Array.new
      #@operators = %w(+ - * / sqrt) #fourfunction
      #@operators += %w(neg swp rot rotd) #stack
      #@operators += %w(!) # Misc Sci.
      #@operators += %w(sin cos tan) # trig
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
      elsif is_function(line)
        handle_function(line)
      else
        warn "invalid input: #{line}"
      end
    end

    def is_operator(token)
      @opfactory.include? token
    end
    def is_operand(token)
      token =~ /\d+(\.\d+)?/
    end
    def is_function(token)
      false
    end

    def handle_operator(op)

      operator = @opfactory.get_operator(op).new
      push(operator.compute(@stack))

      #case op
      #  when "+"
      #    @stack.push(do_plus)
      #  when "-"
      #    @stack.push(do_minus)
      #  when "*"
      #    @stack.push(do_times)
      #  when "/"
      #    @stack.push(do_div)
      #  when "sqrt"
      #    @stack.push(do_sqrt)
      #  when "neg"
      #    @stack.push(do_neg)
      #  when "swp"
      #    do_swap
      #  when "rot"
      #    do_rot
      #  when "tan"
      #    @stack.push(tan)
      #  when "sin"
      #    @stack.push(sin)
      #  when "cos"
      #    @stack.push(cos)
      #  when "rotd"
      #    do_rotd
      #  when "!"
      #    @stack.push(do_factorial)
      #end
    end

  end
end