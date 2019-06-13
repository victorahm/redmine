namespace :redmine do
  task :finish_deploy do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: "#{fetch(:stage)}" do
          execute :rake, 'redmine:plugins:migrate'
          execute :rake, 'generate_secret_token'
          execute :rake, 'tmp:cache:clear'
        end
      end
    end
  end
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, :restart
end
