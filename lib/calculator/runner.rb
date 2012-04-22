

module Calculator
  class Runner
    def initialize(input,output)
      @input = input
      @output = output
    end

    def get_next_line
      @input.gets
    end
  end
end