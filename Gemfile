# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'active_model_serializers', '~> 0.10.12'
gem 'bcrypt', '~> 3.1.12'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails', '~> 2.7.6'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 1.1.1'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'ransack', '~> 2.4', '>= 2.4.2'
gem 'rubocop', '~> 1.15'

group :development, :test do
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'rubocop-rails', '~> 2.8.1', require: false
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
