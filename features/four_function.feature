
Feature: basic stack manipulation

  Scenario: User starts calculator
    Given a new calculator
    When it starts
    Then I should see the prompt

  Scenario: User pushes/pops operands
    Given a calculator
    When I push an "operand"
    Then the "operand" should be on top of the stack
#
#    Given an empty stack
#    When I pop
#    Then I should see "Can't pop empty stack"
#
#    Given a non-empty stack
#    When I pop
#    Then it should return the top element of the stack
#    And it should remove the top element of the stack
#
#  Scenario: User inputs a function
#
#    Given a calculator
#    When I push an "operator"
#    Then the "operator" should be on top of the stack
#    And the stack should be evaluated
#
#    Given a stack with "3" "elements
#    When I enter "SWP"
#    Then the top two elements of the stack should exchange



#    Given a calculator with 1 operands
#    When I input a binary operator
#    Then it should raise an exception
#
#    Given a calculator with 1 operands
#    When I input a unary operator
#    Then it should pop the operator
#    And it should pop 1 operands
#    And it should push "the result"


#
#Feature: addition
#pending
#  Scenario: add two numbers

#
#Feature: some feature name
#
#  Background: common feature state
#
#  @tag
#  Scenario: feature in action
#    Given start state
#    When event occurs
#    Then expected result
#    And another expected result
#    But not this other result
#
#  Scenario Outline:
#  | var1 | var2 | expectation |
#  | val1 | val2 | result1 |
#
