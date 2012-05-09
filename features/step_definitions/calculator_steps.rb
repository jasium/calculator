include Calculator

Before do
  @out = Calculator::Output.new
end

Given /^a new calculator$/ do
  @calc = HP48GX.new(@out)
end

When /^I push an "([^"]*)"$/ do |arg1|
  @calc.push(arg1)
end

Then /^the "([^"]*)" should be on top of the stack$/ do |arg1|
  arg1.should == @calc.top
end

Then /^the stack should be evaluated$/ do
  @calc.evaluate
end

Given /^a calculator with (\d+) operands$/ do |count|
  1.upto(count.to_i) { |i| @calc.push(i) }
end

When /^I input a binary operator$/ do
  @calc.push("+")
end

When /^I input a unary operator$/ do
  @calc.push("sqrt")
end

Then /^it should pop the operator$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should pop (\d+) operands$/ do |arg1|
end

Then /^it should push "([^"]*)"$/ do |arg1|
  @calc.stack.top.should == arg1
end

When /^it starts$/ do
  @calc.start
end

Then /^I should see the prompt$/ do
  @out.messages.should include "> "
end

Then /^I should see "([^"]*)"$/ do |arg1|
  @out.messages.should include arg1
  end


Given /^a calculator$/ do
  @calc = HP48GX.new(@out)
end

When /^I pop from an empty stack$/ do
  @calc = HP48GX.new(@out)
  @calc.pop
end

When /^I enter "([^"]*)"$/ do |arg1|
  @calc.push(arg1)
end

Then /^the top two elements of the stack should exchange$/ do
  top = @calc.top
  top2nd = @calc.top2nd
  @calc.do_swap
  @calc.top2nd.should == top
  @calc.top.should == top2nd
end

Given /^a stack with "([^"]*)" "elements$/ do |size|
  1.upto(size.to_i) { |i| @calc.push(i)}
end

Given /^an empty stack$/ do
end

Given /^a non\-empty stack$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I pop$/ do
  @calc.pop
end

Then /^it should return the top element of the stack$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the stack size should decrease by (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

#describe Calculator do
#it "should be on top of the stack" do
#  calc = Calculator.new
#  calc.compute("5")
#  calc.stack.top.should == 5
#end
#
#end