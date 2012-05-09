require_relative '../operator.rb'
module Calculator
  class Factorial < Operator

    def self.token
      '!'
    end
    Operator.register(self)

    def compute(stack)
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
    Operator.register(self)

    def compute(stack)
      0 - stack.pop
    end
  end

  class Swap < Operator

    def self.token
      'swp'
    end
    Operator.register(self)

    def compute(stack)
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
    Operator.register(self)

    def compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      stack.shift
    end
  end

  class Rotd < Operator

    def self.token
      'rotd'
    end
    Operator.register(self)

    def compute(stack)
      raise "Insufficient items on stack" if stack.size < 2
      stack.unshift(stack.pop)
      nil
    end
  end
end