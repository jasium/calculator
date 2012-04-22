
module Calculator
  class Input
    def initialize
      @messages = []
    end

    def messages
      @messages
    end
    def puts(message)
      @messages << message
    end
    def gets
      @messages.delete_at(0)
    end

    def <<(message)
      if message.is_a?(Array)
        @messages.concat(message)
      else
        @messages << message
      end
    end
  end
end