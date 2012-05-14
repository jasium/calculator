require_relative '../operator.rb'
module Calculator
  class Factorial < Operator

    def self.token
      '!'
    end

    def self.compute(stack)
      var1 = stack[stack.size-1]  #      stack.top
      raise "Factorial only valid against positive integers" unless (0 == var1 - var1.floor)
      raise "Factorial only valid against positive integers" unless (var1 > 1)
      var1 = stack.pop
      (1..var1).inject(:*)
    end
  end
  class Negate< Operator

    def self.token
      'neg'
    end

    def self.compute(stack)
      0 - stack.pop
    end
  end

  class Swap < Operator

    def self.token
      'swp'
    end

    def self.compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      t = stack.pop(2).reverse
      t.each {|n| stack.push(n)}
      nil
    end
  end

  class Rot < Operator

    def self.token
      'rot'
    end

    def self.compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      stack.shift
    end
  end

  class Rotd < Operator

    def self.token
      'rotd'
    end

    def self.compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      stack.unshift(stack.pop)
      nil
    end
  end

  class Exp < Operator
    def self.token
      'exp'
    end

    def self.compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      num= stack.pop
      exponent = stack.pop
      num ** exponent
    end
  end
end