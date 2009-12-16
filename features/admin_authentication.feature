Feature: Admin authentication
  In order to manage Use jQuery
  As a Administrator
  I want to login/logout

  Scenario: Admin login
    Given I am not logged in as admin
    When I go to path "/admin"
    And I fill in "Username" with "root"
    And I fill in "Password" with "toor"
    And I press "Login"
    Then I should see "Hello Master!"
  
  Scenario: Admin logout
    Given I am logged in as admin
    When I go to path "/admin/logout"
    Then I am not logged in as admin