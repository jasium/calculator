require "rspec"
require "spec_helper"

module Calculator
  describe HP48GX do
    let(:output) { double('output').as_null_object }
    let(:input) { Input.new } #double('input').as_null_object }
    let(:calc)   { HP48GX.new(output) }
    def prep_calc(lines)
      input << lines
      runner = Runner.new(input,output)
      lines.each {|inp|
        calc.handle_input(runner.get_next_line)
      }
    end
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


    describe "#scientific calculator" do

      describe "performs trig functions" do
        it "tan (tangent)" do
          prep_calc(['0','tan'])
          calc.top.should == 0
        end
        it "sin (sine)" do
          prep_calc(['0','sin'])
          calc.top.should == 0
        end
        it "cos (cosine)" do
          prep_calc(['0','cos'])
          calc.top.should == 1
        end

      end
      describe "! (factorial)" do
        it "! (computes factorial)" do
          prep_calc(['5','!'])
          calc.top.should == 120

          prep_calc(['5.5'])
          lambda {
            calc.handle_input("!")
          }.should raise_error("Factorial only valid against positive integers")
        end

        it "errors when it gets a float" do
          prep_calc(['5.5'])
          lambda {
            calc.handle_input("!")
          }.should raise_error("Factorial only valid against positive integers")
        end

        it "errors when it gets a negative" do
          prep_calc(['-5'])
          lambda {
            calc.handle_input("!")
          }.should raise_error("Factorial only valid against positive integers")
        end
      end

      describe "neg (negation)" do
        it "negates numbers when it receives 'neg'" do
          prep_calc(['16','neg'])
          calc.top.should == -16

          prep_calc(['-15','neg'])
          calc.top.should == 15
        end

      end

      describe "Stack"do
        describe "swp (swap)" do
          it "swaps the top items on the stack when it receives 'swp'" do
            prep_calc(['1','2','swp'])
            calc.top.should == 1
            calc.top2nd.should ==2
          end

          it "Complains about 1-item stacks" do
            expect {
              prep_calc(['1','swp'])
            }.to raise_error("Insufficient items on stack")
            calc.top.should == 1
            calc.stack.size.should == 1
          end
        end

        describe "rot (Rotate)" do
          it "puts the bottom item on top of the stack" do
            prep_calc(['1','2','3','4','rot'])
            calc.top.should == 1
          end
        end

        describe "rotd (Rotate down)" do
          it "puts the top item on the bottom of the stack" do
            prep_calc(['1','2','3','4','rotd'])
            calc.top.should == 3
          end
        end
      end
    end

    describe "#4-function calculator" do
      it "binary operators pop both operands, push result" do
        prep_calc(["1","1"])
        expect {
          calc.handle_input("+")
        }.to change{calc.stack.size}.by(-1)
      end

      it "+" do
        prep_calc(["1","1",'+'])
        calc.top.should == 2
      end

      it "- (subtraction)" do
        prep_calc(["5","3", '-'])
        calc.top.should == 2
      end

      it "* (multiplication)" do
        prep_calc(["5","5","*"])
        calc.top.should == 25
      end

      it "/  (division)" do
        prep_calc(['10','2', '/'])
        calc.top.should == 5
      end

      it "sqrt (square root)" do
        prep_calc(['16','sqrt'])
        calc.top.should == 4
      end

      it "unary operators pop 1 operand, push result" do
        prep_calc(["16"])
        expect {
          calc.handle_input("sqrt")
        }.to change{calc.stack.size}.by(0)
      end


    end
  end
end