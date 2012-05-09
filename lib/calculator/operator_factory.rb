
module Calculator
  class OperatorFactory

    @@OF = self
    @@token_map = Hash.new

    def initialize(dirname)
      #puts "initializing OperatorFactory @ #{dirname}"
      dir = Dir.entries(dirname).each do |entry|
        next unless File.fnmatch '*.rb', entry
#        puts "loading #{entry}"
        require "#{dirname}/#{entry}"
      end
    end

    def get_operator(op)
      @@token_map[op]
    end

    def self.get_factory
      @@OF
    end

    def include?(token)
      false == @@token_map[token].nil?
    end
    def self.register_operator(operator)
      raise "attempt to register invalid operator: #{operator}" if (operator.nil?  || operator.token.nil?)
      raise "error: attempting to rebind #{token} bound to #{existing}" if @@token_map.include?(operator.token)
      @@token_map[operator.token] = operator
    end
  end
end