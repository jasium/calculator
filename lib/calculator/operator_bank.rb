module Calculator
  class OperatorBank

    def initialize
#      warn "OperatorBank#initialize called from\n#{caller[0..2].join("\n")}"
      @token_map = Hash.new
    end

    def load_from_dir(dirname)
#      warn "#{self} loading from #{dirname}"
#      p $".select {|path| path =! "operator"}
      dir = Dir.entries(dirname).each do |entry|
        filename = "#{dirname}/#{entry}"
#        warn "checking #{filename}"
        next unless File.fnmatch '*.rb', entry
#        warn "loading #{filename}"
        require filename
      end
      Operator.register_subclasses(self)
#      p self
#      warn "#{self} load complete"
    end

    def get_operator(token)
      @token_map[token]
    end

    def include?(token)
 #     puts "#{self}#include checking for #{token}: #{get_operator(token)}"
#      p self
      get_operator(token)
    end

    def register_operator(operator)
      raise "attempt to register invalid operator: #{operator}" if (operator.nil?  || operator.token.nil?)
      raise "error: attempting to rebind #{token} bound to #{existing}" if @token_map.include?(operator.token)
      @token_map[operator.token] = operator
   #   puts "#{self} mapping #{operator.token} to #{get_operator(operator.token)}"
    end
  end
end