source 'https://rubygems.org'
ruby '2.2.2'

# Select2 is a jQuery based replacement for select boxes
gem "select2-rails"
gem 'devise'
gem 'haml'
gem 'paperclip'
gem 'materialize-sass'

# AWS
gem 'aws-sdk', '~> 1.36.1'
gem 'fog'
gem 'figaro'

gem 'chart-js-rails'

gem 'cocoon'
gem 'react-rails'
# gem 'simple_form'
# simple_form may make dynamically created form fields easier on cocoon
# however, it is not required, so I am waiting on adding it for now.

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do

  gem 'puma'
  gem 'rails_12factor'

end

group :development, :test do
  gem 'pry'
  gem 'byebug'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'simplecov'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

