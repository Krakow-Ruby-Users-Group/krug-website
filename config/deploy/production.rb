set :stage, :production
server '139.59.211.87', user: 'deploy', roles: %w{web app db}
