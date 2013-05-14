source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'geocoder', '~> 1.1.8' #for address distances https://github.com/alexreisner/geocoder for how to use
gem 'activeadmin', :github => 'gregbell/active_admin'  #https://github.com/gregbell/active_admin has good documentation
gem 'sass-rails',   '~> 3.2.3'
gem 'meta_search', '>= 1.1.0.pre'  #dependency for AA
#gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'twitter-bootstrap-rails' #bootstrap-responsive friendly view generator - check out https://github.com/seyhunak/twitter-bootstrap-rails for using the generators - do NOT install this fully - ONLY USE GENERATOR FOR VIEWS
gem 'devise' # authentication https://github.com/plataformatec/devise for how to use
gem 'thin' #use as server instead of webrick - webrick mucks up logging with bootstrap
gem 'formtastic' #for better forms with built in error reporting - similar syntax to AA - wiki is helpful here https://github.com/justinfrench/formtastic
gem 'kaminari' #for pagination
gem 'formtastic-bootstrap' #for styling formtastic forms with bootstrap

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',       '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.3.0.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
end

group :development, :test do
  gem 'rspec',              '~> 2.13.0'
  gem 'rspec-rails',        '~> 2.13.0'
  gem 'shoulda-matchers',   '~> 1.4.2'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'pry',                '~> 0.9.12'
  gem 'sqlite3'
end

group :test do
  gem 'mocha', require: false #needed to fix error
  gem 'capybara', '~> 2.0.2'
  gem 'launchy',  '~> 2.2.0'
end

group :production do
  gem 'pg', '0.12.2'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
