Feature: Posts management
  In order to manage blog posts
  As a admin
  I want add/edit/preview/delete blog posts
  
  Scenario: Add a valid blog post
    Given I am logged in as admin
    And a post_category exists with name: "Roundup"
    When I go to path "/posts/new"
    And I fill in "Title" with "Example Post"
    And I fill in "Excerpt" with "This is a example post."
    And I fill in "Content" with "Whatever the content is about."
    And I check "Roundup"
    And I check "Published"
    And I press "Create Post"
    Then I should see "Example Post" within "h1"
    And I should see "Roundup"
    
  Scenario: Add a invalid blog post
    Given I am logged in as admin
    When I go to path "/posts/new"
    And I press "Create Post"
    Then I should see "can't be blank"