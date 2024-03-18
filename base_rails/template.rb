RAILS_VERSION = '~> 7.1.3'

def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

puts "Applying Base Rails template..."

puts "\nAdding Gems..."
puts "-------------------------------------"
gem_group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end


puts "-------------------------------------"
puts "Done"

after_bundle do
  puts "\nInstalling Rspec..."
  puts "-------------------------------------"
  generate 'rspec:install'

  insert_into_file '.rspec', <<~CODE
    --color -f d
    --require spec_helper
  CODE
  puts "-------------------------------------"
  puts "Done"

  puts "\nCopying Files..."
  puts "-------------------------------------"
  directory "rails_root", "./"
  puts "-------------------------------------"
  puts "Done"

  puts "\nPinning index react component..."
  puts "-------------------------------------"
  inside 'config' do
    insert_into_file 'importmap.rb',
      "pin 'components/index.jsx', to: 'components/index.js'\n"
  end
  puts "-------------------------------------"
  puts "Done"

  inside 'app' do
    inside 'javascript' do
      insert_into_file 'application.js',
        "import 'components/index.jsx'"
    end
  end


  puts "\nCreating Database..."
  puts "-------------------------------------"
  run 'rake db:create'
  puts "-------------------------------------"
  puts "Done"

  puts "\nCommitting Changes..."
  puts "-------------------------------------"
  git 'commit -am "Base Rails template applied"'
  puts "-------------------------------------"
end

puts "Done applying Base Rails template"
