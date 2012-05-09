require_relative '../operator.rb'
module Calculator
  class Tan < Operator

    def self.token
      'tan'
    end
    Operator.register(self)

    def compute(stack)
      Math.tan(stack.pop)
    end
  end
  class Sin < Operator

    def self.token
      'sin'
    end
    Operator.register(self)

    def compute(stack)
      Math.sin(stack.pop)
    end
  end
  class Cos < Operator

    def self.token
      'cos'
    end
    Operator.register(self)

    def compute(stack)
      Math.cos(stack.pop)
    end
  end
end
