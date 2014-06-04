gem 'juice', git: 'git://github.com/weblemonade/juice.git'

# data
gem 'pg'
gem 'foreigner'
# gem 'acts_as_indexed'
gem "paranoia", "~> 2.0"

# users, authorization and permissions
gem 'cancan'
gem 'devise'

# dry efficient code
gem 'inherited_resources'
gem 'slim-rails'

# ui
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'font-awesome-rails'
gem "select2-rails"
gem 'country_select'
# gem 'simple_form'
gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form'
gem 'show_for'
gem 'will_paginate-bootstrap'
gem 'paperclip'

gem 'bitmask_attributes', git: 'git://github.com/jigfox/bitmask_attributes.git', :branch => 'rails4'
# gem 'delayed_job_active_record'
# gem 'daemons'
# gem 'nokogiri'
gem 'acts_as_tenant' if yes? "Is your application multi-tenant?"

# api
gem 'grape' if yes? "Do you want to expose an API?"

# errors, performance, monitoring
# gem 'exception_notification'
# gem 'newrelic_rpm'


gem_group :development, :test do
  gem "factory_girl_rails", "~> 4.0"
end

gem_group :test do
  gem 'rspec-rails'
  gem 'rspec-instafail'
  gem 'shoulda'
  gem 'database_cleaner'
  gem 'guard'
  gem 'rb-fsevent'            # Guards uses this to look for file changes on OSX
  # gem 'wdm', '~> 0.1'       # Guard uses this to look for file changes on Windows
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'guard-migrate'
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'capybara'
  gem 'simplecov'
  gem 'simplecov-rcov', :require => false
end

run 'bundle install'

generate "juice:install"