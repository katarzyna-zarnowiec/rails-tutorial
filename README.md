# References
- [1] http://guides.rubyonrails.org
- [2] https://www.railstutorial.org/book/beginning - the most complete Rails tutorial that I was able to find in web
- [3] https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

# What is rails
https://www.railstutorial.org/book/beginning#sec-introduction
http://guides.rubyonrails.org/getting_started.html

# Aim of this tutorial
The aim of this short tutorial is the very basic introduction into rails development,
it is based on resources from [2] and [3]

# Step 1. Create new API rails app
Commit :turtle: [ccba7cb63389e64911ffa6a608a966bdee2a1e41](https://github.com/tortuga-feliz/rails-tutorial/commit/ccba7cb63389e64911ffa6a608a966bdee2a1e41)

To create new rails app run
```
rails new rails-tutorial --api -T --database=mysql
```
Then run

```
rails -h
```
and check help to understand all the parameters

```
-T, [--skip-test], [--no-skip-test]                    # Skip test files
    [--api], [--no-api]                                # Preconfigure smaller stack for API only apps
```

`--api` option creates api-only app
It configures your application to use more limited set of middleware than normal.
It won't add any middleware needed for browser apps by default, for example cookies
support won't be added. When generating new resource, it will skip generating views,
helpers or assets associated with that resource [1]

`-T` skips Minitest as the default testing framework, `test` directory won't be added,
also test-helper won't be created

`--database=mysql` will configure app to use mysql database

# Step 2. Add rspec support
Commit :turtle: [108eeda9a8c46bf0a2e45125682c7038376d3514](https://github.com/tortuga-feliz/rails-tutorial/commit/108eeda9a8c46bf0a2e45125682c7038376d3514)

Following the steps listed in tutorial [3]

Open `gemfile` and into `:development, :test` group add `rspec-rails` and
`factory_bot_rails, shoulda_matchers, faker and database_cleaner` into `:test` group
as listed below

```
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end
```

```
group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end
```

- `rspec` - testing framework, see: https://github.com/rspec/rspec-rails
- `factory_bot_rails` - enables to add factories of test data, replacement for fixtures
https://github.com/thoughtbot/factory_bot_rails
- `shoulda_matchers` - additional matchers for rspec, https://github.com/thoughtbot/shoulda-matchers
- `database_cleaner` - set of strategies to clean database, so tests always run in clean state https://github.com/DatabaseCleaner/database_cleaner
- `faker` - fake data library, https://github.com/stympy/faker

Install those gems running
```
bundle install
```
And then initialize directory to store tests + add configuration files running
```
rails generate rspec:install
```

It creates for you:
```
create  .rspec
create  spec
create  spec/spec_helper.rb
create  spec/rails_helper.rb
```

Then configure `rails-helper`

- add `database_cleaner` support
```
require 'database_cleaner'
```
and into config

  ```
  RSpec.configure do |config|

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
      DatabaseCleaner.cleaning do
        example.run
      end
    end

  end
  ```

- add `shoulda_matchers`
```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```
- add `factory_bot` methods
```
config.include FactoryBot::Syntax::Methods
```

# Step 3. Some Model-View-Controller theory
- https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/

# Step 4. Rails command line basics
- http://guides.rubyonrails.org/command_line.html

Try it out yourself!

# Step 5. Models & migrations

> Migrations are a convenient way to alter your database schema over time in a consistent and easy way. They use a Ruby DSL so that you don't have to write SQL by hand, allowing your schema and changes to be database independent.

> You can think of each migration as being a new 'version' of the database. A schema starts off with nothing in it, and each migration modifies it to add or remove tables, columns, or entries.

[http://guides.rubyonrails.org/active_record_migrations.html]


In order to create Users model run:

```
bundle exec rails generate model User name:string surname:string email:string
```

this will auto-generate for us migration, model file and spec
```
create    db/migrate/20180304211656_create_users.rb
create    app/models/user.rb
invoke    rspec
create    spec/models/user_spec.rb
```

First create DB (database)
```
bundle exec rails db:setup
```

Then to execute migration run
```
bundle exec rails db:migrate
```

Other useful commands [RoR guides for more info](http://edgeguides.rubyonrails.org/active_record_migrations.html#running-migrations)
```
rails db:setup
rails db:rollback
rails db:migrate VERSION=20080906120000
rails db:rollback STEP=3
rails db:migrate:redo STEP=3
```
