# README

### Postgres for Database
1. gem 'pg', '>= 0.18', '< 2.0'
2. bundle install
3. create database.yml file
4. rails db:create
5. rails db:migrate


### Release Note
1. Create database.yml file inside config folder; by renaming database.yml.example file
2. Create database using command: rails db:create
3. Run migrations using command: rails db:migrate
4. There are teo modules User and Article
5. User can create a multiple articles and can manage it.
6. To run test suite use command: bundle exec rspec spec
7. Added a strong paramter for injection Attacks
