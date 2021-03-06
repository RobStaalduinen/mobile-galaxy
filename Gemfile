source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pkg-config"

gem 'rails', '~> 5.1.4'
gem 'nokogiri', '~> 1.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.20.0'
gem 'market_bot'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'redis-namespace', '~> 1.5.3'
gem 'figaro'
gem 'itunes-search-api'
gem 'engtagger'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'puma', '~> 3.7'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Deployment

  gem 'capistrano', '~> 3.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-npm'
  gem 'capistrano-passenger'
  gem 'capistrano-figaro-yml'
  gem 'capistrano3-delayed-job'
  gem 'capistrano-rails-console'
  gem 'capistrano-db-tasks', require: false, git: 'https://github.com/sgruhier/capistrano-db-tasks.git'
  gem 'capistrano-nc', '~> 0.1'
  gem 'capistrano-maintenance', require: false
  gem 'capistrano-upload-config'
  gem 'capistrano-rake', require: false
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'cap-ec2'
  gem 'capistrano-sidekiq', git: 'https://github.com/seuros/capistrano-sidekiq.git'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
