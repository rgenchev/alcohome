Alcohome project

How to setup dev env:

1. bundle install
2. add config.secret_key to <project>/config/initializers/devise.rb
3. config/database.yml
4. config/secrets.yml
5. bin/rails db:migrate RAILS_ENV=development
6. run `yarn install` to install dependencies
7. run `rails c` to open the console
8. `User.create!(email: "email@example.com", password: "password", role: "admin")` to create admin user
9. run `rails s` to start the server
10. go to `/users/sign-in` to log in
11. Create categories from localhost:3000/admin
