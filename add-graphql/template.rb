
puts "Applying Graphql Template..."
gem 'graphql'
gem_group :development do
  gem 'graphiql-rails'
end

after_bundle do
  puts "\nCommitting Changes..."
  puts "-------------------------------------"
  git 'commit -am "Add Graphql template applied"'
  puts "-------------------------------------"
end
puts "Done applying Graphql Template"
