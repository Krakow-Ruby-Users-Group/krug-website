set :application, 'krug'
set :repo_url, 'git@github.com:gajewsky/krug-website.git'
set :deploy_to, '/home/mensfeld/rails/krug'

set :linked_files, %w{config/database.yml config/secrets.yml config/settings.yml}
set :linked_dirs, %w{bin log tmp public/system public/assets public/uploads .bundle bundle}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
