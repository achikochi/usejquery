Factory.define :post_category do |f|
  f.name "Roundups"
end

Factory.define :post do |f|
  f.title "Some Tutorial"
  f.excerpt "This is the excerpt."
  f.content "And the main content."
  f.published false
end