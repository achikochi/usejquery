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
    
  Scenario: Non-Admin wants to add a blog post
    Given I am not logged in as admin
    When I go to path "/posts/new"
    Then I should see "Unauthorized access"
    
  Scenario: Can't preview a unpublished post as non-admin
    Given I am not logged in as admin
    And a post exists with title: "Not published", published: false
    When I go to the show page for that post
    Then I should see "404"
  
  Scenario: Admin can preview a post
    Given I am logged in as admin
    And a post exists with title: "Preview me", published: false
    When I go to the show page for that post
    Then I should see "Preview me"