server 'ebisu', user: 'mensfeld', roles: %w{web app db}
set :stage, :production

set :ssh_options, forward_agent: true

set :linked_files, %w{
  config/secrets.yml
  config/database.yml
}
