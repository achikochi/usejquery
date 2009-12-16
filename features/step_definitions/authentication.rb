Given /^I am not logged in as admin$/ do
  visit new_post_path
  response.should contain "Unauthorized access"
end

Given /^I am logged in as admin$/ do
  visit admin_login_path
  fill_in "Username", :with => "root"
  fill_in "Password", :with => "toor"
  click_button "Login"
  response.should contain "Hello Master!"
end