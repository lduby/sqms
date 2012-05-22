Feature: User story creation
  In order to define a feature in small parts to be implemented quicker
  As a business analyst
  I want to be able to create user stories
  
    Background:
      Given I am logged in 
      And I have the role analyst

    Scenario: User creates a story with valid data
      When I create a story with valid data
      Then I should see a successful creation message
      
    Scenario: User creates a story without a title
      When I create a story without a title
      Then I should see an missing title message

    Scenario: User creates a story without a role
      When I create a story without a role
      Then I should see an missing role message

    Scenario: User creates a story without a valid role
      When I create a story without a valid role
      Then I should see an invalid role message

    Scenario: User creates a story without a goal
      When I create a story without a goal
      Then I should see an missing goal message



