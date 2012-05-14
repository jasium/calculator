module Calculator
  class Operator

    @@unregistered = []

    def self.inherited(subclass)
      @@unregistered << subclass
    end

    def self.register_subclasses(bank)
      @@unregistered.each do |subclass|
        bank.register_operator(subclass) unless bank.include? subclass.token
      end
    end

    def compute
      raise "#compute not implemented in child class #{self}!"
    end

    def token
      raise "#token not implemented in child class #{self}!"
    end
  end
end