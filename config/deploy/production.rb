server 'ebisu', user: 'mensfeld', roles: %w{web app db}
set :stage, :production

set :linked_files, %w{
  config/secrets.yml
  config/database.yml
}

set :linked_dirs, %w{
  log
  tmp
  public/assets
  .bundle
  bundle
}

namespace :deploy do
  after :finished, 'app:fix_assets'
end
