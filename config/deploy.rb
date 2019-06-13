# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'redmine'
set :repo_url, 'git@github.com:victorahm/redmine.git'

set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/rails_apps/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

set :passenger_restart_with_sudo, true
set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/configuration.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets', 'public/themes', 'public/plugin_assets', 'files', 'plugins'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
namespace :deploy do

  before 'deploy:publishing', 'redmine:finish_deploy'

#  after 'deploy:published', 'passenger:restart'

end
