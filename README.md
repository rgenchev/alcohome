Alcohome project

How to setup dev env:

1. bundle install
2. Add config.secret_key to <project>/config/initializers/devise.rb
3. config/database.yml
4. config/secrets.yml
5. bin/rails db:migrate RAILS_ENV=development
6. Create categories from localhost:3000/admin