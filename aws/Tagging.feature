  Scenario: Ensure all resources have tags
    Given I have resource that supports tags defined
    Then it must contain tags
    And its value must not be null

Scenario Outline: Ensure that specific tags are defined
    Given I have resource that supports tags defined
    When it contains tags
    Then it must contain <tags>
    And its value must match the "<value>" regex

    Examples:
      | tags        | value              |
      | Name        | .+                 |
      | application | .+                 |
      | role        | .+                 |
      | environment | ^(prod\|stage\|dev)$ |
      | owner       | .*@.*              |
      | costcenter  | \w+\w+\w+-\d\d     |
