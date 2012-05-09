
Feature: basic stack manipulation

  Scenario: User starts calculator
    Given a new calculator
    When it starts
    Then I should see the prompt

  Scenario: User pushes/pops operands
    Given a calculator
    When I push an "operand"
    Then the "operand" should be on top of the stack

    Given an empty stack
    When I pop
    Then I should see "an error message"

    Given a non-empty stack
    When I pop
    Then it should return the top element of the stack
    And it should remove the top element of the stack

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
