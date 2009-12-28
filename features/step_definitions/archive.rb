Then /^I should get redirected to the archived site "([^\"]*)"$/ do |site_id|
  current_url.should contain site_id
end

When /^I goe to the slug path for "([^\"]*)"$/ do |site_name|
  site = Site.find_by_name site_name
  visit site_slug_path(site, site.slug)
end
