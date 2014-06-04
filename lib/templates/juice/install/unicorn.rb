# https://gist.github.com/shmatov/4078612

app_path = "/var/www/#{app_name}/current"
 
worker_processes   1
preload_app        true
timeout            180
# listen             '127.0.0.1:9021'
# user               'www-data', 'www-data'
listen "#{app_path}/tmp/sockets/unicorn.sock", :backlog => 64
# listen 8080, :tcp_nopush => true

working_directory  app_path
pid                "#{app_path}/tmp/pids/unicorn.pid"
stderr_path        "#{app_path}/log/unicorn.log"
stdout_path        "#{app_path}/log/unicorn.log"
 
before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!
 
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
 
after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end