# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'redmine'
set :repo_url, 'git@github.com:victorahm/redmine.git'

set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/rails_apps/#{fetch(:application)}"

set :stages, ["production"]
set :default_stage, "production"

set :passenger_restart_with_sudo, true
set :pty, true

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/configuration.yml')

# Default value for linked_dirs is []
 set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets', 'public/themes', 'public/plugin_assets', 'files', 'plugins')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  
  before 'deploy:publishing', 'redmine:finish_deploy'
  
#  after 'deploy:published', 'passenger:restart'
  

end
