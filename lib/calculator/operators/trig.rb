require_relative '../operator.rb'
module Calculator
  class Tan < Operator

    def self.token
      'tan'
    end

    def self.compute(stack)
      Math.tan(stack.pop)
    end
  end

  class Sin < Operator

    def self.token
      'sin'
    end

    def self.compute(stack)
      Math.sin(stack.pop)
    end
  end

  class Cos < Operator

    def self.token
      'cos'
    end

    def self.compute(stack)
      Math.cos(stack.pop)
    end
  end
end
