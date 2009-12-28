Feature: Redirect to archive
  In order to get to the old website content
  As a visitor
  I want to get redirected

  Scenario: Going to an old URL without slug
    When I go to path "/sites/337"
    Then I should get redirected to the archived site "337"
  
  Scenario: Going to a new site with slug
    Given a site exists with name: "Whatever"
    When I goe to the slug path for "Whatever"
    Then I should see "Whatever"
  
  
  