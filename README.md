# Welcome!
This project is a collection of rails application templates.

[Base Rails](base_rails/)
Use this rails application generator to get a sparkly new rails app with:
- Factory Bot
- Fakr
- Rspec
- Rubocop

[Add React/Typescript](add-react-typescript)
Apply this template from an existing project to set up react with typescript with:
```
bin/rails app:template LOCATION=../rails-application-templates/add-react-typescript/template.rb`
```
(This assumes this repo and the target rails app are in the same parent directory)

[Add GraphQL](add-graphql)
Apply this template from an existing project to set up GraphQL:
```
bin/rails app:template LOCATION=../rails-application-templates/add-graphql/template.rb`
```
(This assumes this repo and the target rails app are in the same parent directory)

# Setup
Clone this repo to your system

A suggested [railsrc](railsrc) file is provided, link it to your home directory with
```
ln railsrc ~/.railsrc
```
Generate your base app with 
```
rails new ./ -m ~/path_to_this_repo/template.rb
```
