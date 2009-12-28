Feature: Blog search
  In order to find posts
  As a user
  I want to search the blog

  Scenario: Search with results
    Given a post exists with title: "Some wicked tutorial", published: true
    When I go to path "/posts"
    And I fill in "search" with "wicked"
    And I press "Search"
    Then I should see "Some wicked tutorial"
  
  Scenario: Search without results
    Given a post exists with title: "Best of the best of the best", published: true
    When I go to path "/posts"
    And I fill in "search" with "wicked"
    And I press "Search"
    Then I should not see "Best of"
    And I should see "404"