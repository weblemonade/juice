# https://gist.github.com/shmatov/4078612

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

set :domain, 'example.com'
set :port, "22"
set :user, 'deploy'
set :app_name, 'app-name'

set :deploy_to, '/var/www/#{app_name}'
set :app_path,   "#{deploy_to}/#{current_path}"
set :repository, 'git@github.com:weblemonade/#{app_name}.git'
set :branch, 'master'
set :term_mode, :system
set :rails_env, 'staging'
set :keep_releases,   5

set :shared_paths, ['config/database.yml', 'log', 'tmp']

task :environment do
  queue "source /etc/profile"
end

task :setup => :environment do
  queue! %{ mkdir -p "#{deploy_to}/shared/tmp/pids"}
  queue! %{ mkdir -p "#{deploy_to}/shared/tmp/sockets"}

  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do

  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
    invoke :'deploy:link_shared_paths'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end


namespace :unicorn do
  set :unicorn_pid, "#{app_path}/tmp/pids/unicorn.pid"
  set :start_unicorn, %{
    cd #{app_path}
    bundle exec unicorn -c #{app_path}/config/unicorn/#{rails_env}.rb -E #{rails_env} -D
  }
 
#                                                                    Start task
# ------------------------------------------------------------------------------
  desc "Start unicorn"
  task :start => :environment do
    queue 'echo "-----> Start Unicorn"'
    queue! start_unicorn
  end
 
#                                                                     Stop task
# ------------------------------------------------------------------------------
  desc "Stop unicorn"
  task :stop do
    queue 'echo "-----> Stop Unicorn"'
    queue! %{
      test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && echo "Stop Ok" && exit 0
      echo >&2 "Not running"
    }
  end
 
#                                                                  Restart task
# ------------------------------------------------------------------------------
  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end

