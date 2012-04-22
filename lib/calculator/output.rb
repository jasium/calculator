
module Calculator
  class Output
    def messages
      @messages ||= []
    end
    def puts(message)
      messages << message
    end
    def output
      @out ||= Output.new
    end
  end
end