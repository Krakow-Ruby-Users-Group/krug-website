server 'ebisu', user: 'mensfeld', roles: %w{web app db}
set :stage, :production

set :linked_files, %w{
  config/secrets.yml
  config/database.yml
}
