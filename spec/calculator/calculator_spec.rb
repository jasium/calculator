require "rspec"
require "spec_helper"
require "runner.rb"
require "input.rb"
module Calculator
  describe HP48GX do
    let(:output) { double('output').as_null_object }
    let(:input) { Input.new } #double('input').as_null_object }
    let(:calc)   { HP48GX.new(output) }

    describe "#basic input: " do
      it "prompts for input on startup" do
        output.should_receive(:puts).with('> ')
        calc.start
      end

      it "reads lines from the prompt" do
        lines = ["1\n","1\n","+\n"]
        input << lines
        runner = Runner.new(input, output)
        lines.each {|inp|
          line = runner.get_next_line
          line.should equal(inp)
        }
      end

      it "accepts numeric tokens" do
        lines = ["1\n", "1.1\n"]
        input << lines
        runner = Runner.new(input, output)
        lines.each { |inp|
          expect {
            calc.handle_input(runner.get_next_line)
          }.to change{calc.stack.size}.by(1)
        }
      end

    end

    describe "#4-function calculator"
    it "adds when it receives '+'" do
      lines = ["1","1"]
      prep_calc(lines)
      expect {
        calc.handle_input("+")
        calc.top.should == 2
      }.to change{calc.stack.size}.by(-1)
    end

    it "subtracts when it receives '-'" do
      lines = ["5","3"]
      prep_calc(lines)
      expect {
        calc.handle_input("-")
        calc.top.should == 2
      }.to change{calc.stack.size}.by(-1)
    end

    it "pushes operands" do
      pending
    end

    it "interprets functions" do
      pending
    end

    def prep_calc(lines)
      input << lines
      runner = Runner.new(input,output)
      lines.each {|inp|
        calc.handle_input(runner.get_next_line)
      }
    end
  end
end