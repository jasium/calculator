module Calculator
  class Operator

    def compute
      warn "#compute not implemented in child class!"
      #todo figure out how to print a stack trace or the calling class
    end

    def self.register(op)
      OperatorFactory.get_factory.register_operator(op)
    end

    def token
      warn "#token not implemented in child class!"
      #todo figure out how to print a stack trace or the calling class
    end
  end
end