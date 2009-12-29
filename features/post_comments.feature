Feature: Post comments
  In order to leave my mark to a blog post
  As a user
  I want to post comments

  Scenario: Post a valid comment
    Given a post exists with published: true
    And I go to the show page for that post
    When I fill in "Name" with "mustardamus"
    And I fill in "E-Mail" with "contact@mustardamus.com"
    And I fill in "URL" with "http://mustardamus.com"
    And I fill in "Message" with "This is a comment."
    And I press "Create Comment"
    Then I should see "mustardamus"
    And I should see "This is a comment."
  
  
  
