# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'
require 'capistrano/npm'
require 'capistrano/figaro_yml'
require 'capistrano/console'
require 'capistrano/maintenance'


require 'capistrano/rails/console'
require 'capistrano-db-tasks'
require 'capistrano-nc/nc'
require 'capistrano/upload-config'
require 'capistrano/rake'
require 'capistrano/rbenv'
require 'capistrano/sidekiq'

# Potential future use (missing from Gemfile)
# require 'capistrano/sidekiq'
# require 'capistrano/sidekiq/monit' #to require monit tasks # Only for capistrano3
# require 'capistrano/slackify'
# require 'capistrano/bundle_rsync'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

namespace :deploy do
  task :link_sidekiq_assets do
    on roles(:all) do
      within release_path do
        bundle_path = "/var/www/mobile-galaxy/shared/bundle/ruby/2.3.0/gems/sidekiq-5.0.5/web/assets"
        execute "ln -nfs #{bundle_path} /var/www/mobile-galaxy/current/public/sidekiq"
      end
    end
  end
  
end
