Feature: Users
  In order to have a profile
  As a user
  I want to edit and show my profile
  
  Scenario: Edit profile
    Given a logged in user
    When I go to the user edit page
    And I fill in "Gender" with "m"
    And I fill in "Academic title" with "Dr."
    And I fill in "First name" with "Bart"
    And I fill in "Last name" with "Simpson"
    And I fill in "E-mail" with "bart@simpson.xy"
    And I press "Change"
    Then I should see "m"
    And I should see "Dr."
    And I should see "Bart"
    And I should see "Simpson"
    And I should see "bart@simpson.xy"
