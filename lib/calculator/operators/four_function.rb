require_relative '../operator.rb'
module Calculator
  class Plus < Operator

    def self.token
      '+'
    end

    def self.compute(stack)
      var1 = stack.pop
      var2 = stack.pop
      var2 + var1
    end
  end
  class Minus < Operator
      def self.token
        '-'
      end

      def self.compute(stack)
        var1 = stack.pop
        var2 = stack.pop
        var2 - var1
      end
    end

  class Times < Operator
    def self.token
      '*'
    end

    def self.compute(stack)
      var1 = stack.pop
      var2 = stack.pop
      var2 * var1
    end
  end

  class Div < Operator
    def self.token
      '/'
    end

    def self.compute(stack)
      var1 = stack.pop
      var2 = stack.pop
      var2 / var1
    end
  end

  class Sqrt < Operator
    def self.token
      'sqrt'
    end

    def self.compute(stack)
      Math.sqrt(stack.pop)
    end
  end
end