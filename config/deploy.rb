# config valid only for current version of Capistrano
lock '~> 3.0'

server '95.85.55.212', port: 22, user: 'deploy', roles: [:web, :app, :db], primary: true

set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }

set :application, 'mobile-galaxy'
set :repo_url, 'git@github.com:RobStaalduinen/mobile-galaxy.git'
set :branch, 'master'
set :user, 'deploy'
set :deploy_to, '/var/www/mobile-galaxy'
set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'


set :sidekiq_config, -> { File.join(current_path, 'config', 'sidekiq.yml') }
set :sidekiq_processes, 2

# set :npm_roles, :web
# set :npm_flags, '--silent --no-progress' # by default --production is included but we need devDependencies

set :nc_terminal, 'com.googlecode.iterm2'

# Default value for :linked_files is []
append :linked_files, 'config/application.yml', 'config/database.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/locks', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

after 'passenger:restart', 'cache:clear'
after 'passenger:restart', 'deploy:link_sidekiq_assets'
