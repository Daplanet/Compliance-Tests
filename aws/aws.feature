Feature: AWS Credentials should not be within the code
    This feature will enforce to use AWS Credentials either via
    environment variables or via metadata endpoint

    Scenario Outline: AWS Credentials should not be hardcoded
        Given I have aws provider configured
        When it has <key>
        Then it must have <key>
        Then its value must not match the "<regex>" regex

        Examples:
            | key        | regex                                                      |
            | access_key | (?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])                      |
            | secret_key | (?<![A-Za-z0-9\/+=])[A-Za-z0-9\/+=]{40}(?![A-Za-z0-9\/+=]) |
