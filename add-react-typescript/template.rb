RAILS_VERSION = '~> 7.1.3'

def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

puts "Applying React Trypescript Template..."

puts "\nAdding Gems..."
puts "-------------------------------------"
gem 'jass-react-jsx'

puts "-------------------------------------"
puts "Done"

after_bundle do

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

  puts "\nPinning index react libraries..."
  puts "-------------------------------------"
  run "./bin/importmap pin react react-dom react/jsx-runtime"
  puts "-------------------------------------"
  puts "Done"

  puts "\nAdding transform-react-jsx library..."
  puts "-------------------------------------"
  run "yarn add @babel/core @babel/plugin-transform-react-jsx"
  puts "-------------------------------------"
  puts "Done"

  puts "\nGenerating home route..."
  puts "-------------------------------------"
  generate :controller, :home, [:index]
  route "root to: 'home#index'"
  puts "-------------------------------------"
  puts "Done"

  puts "\nGenerating home react component..."
  puts "-------------------------------------"
  generate :react_component, 'home_index'
  insert_into_file 'app/views/home/index.html.erb',
    "<%= render 'application/react_component', name: 'home_index' %>",
    before: '</div>'
  puts "-------------------------------------"
  puts "Done"

  puts "\nCommitting Changes..."
  puts "-------------------------------------"
  git 'commit -am "Add React Typescript template applied"'
  puts "-------------------------------------"
end

puts "Done applying React Trypescript Template"
