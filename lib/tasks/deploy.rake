# https://gist.github.com/shmatov/4078612
# https://raw.github.com/defunkt/unicorn/master/examples/nginx.conf

namespace :deploy do
  desc 'Deploy to staging environment using mina'
  task :staging do
    exec 'mina deploy -f config/deploy/staging.rb'
  end
  task :production do
    exec 'mina deploy -f config/deploy/production.rb'
  end
end