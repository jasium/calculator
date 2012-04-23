require "rspec"
require "spec_helper"

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

    describe "#4-function calculator" do
      it "binary operators pop both operands, push result" do
        prep_calc(["1","1"])
        expect {
          calc.handle_input("+")
        }.to change{calc.stack.size}.by(-1)
      end

      it "adds when it receives '+'" do
        prep_calc(["1","1",'+'])
        calc.top.should == 2
      end

      it "subtracts when it receives '-'" do
        prep_calc(["5","3", '-'])
        calc.top.should == 2
      end

      it "multiplies when it receives '*'" do
        prep_calc(["5","5","*"])
        calc.top.should == 25
      end

      it "divides when it receives '/'" do
        prep_calc(['10','2', '/'])
        calc.top.should == 5
      end

      it "computes square roots when it receives 'sqrt'" do
        prep_calc(['16','sqrt'])
        calc.top.should == 4
      end

      it "negates numbers when it receives 'neg'" do
        prep_calc(['16','neg'])
        calc.top.should == -16
      end

      it "unary operators pop 1 operand, push result" do
        prep_calc(["16"])
        expect {
          calc.handle_input("sqrt")
        }.to change{calc.stack.size}.by(0)
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
end