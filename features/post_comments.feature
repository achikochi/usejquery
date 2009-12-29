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
    And I press "Post Comment"
    Then I should see "Successfully posted your Comment"
    And I should see "mustardamus"
    And I should see "This is a comment."
  
  Scenario: Post a invalid comment
    Given a post exists with published: true
    And I go to the show page for that post
    When I fill in "E-Mail" with "invalid"
    And I fill in "URL" with "invalid"
    When I press "Post Comment"
    Then I should see "must be a valid e-mail address"
    And I should see "must be a valid url"
    And I should see "can't be blank"