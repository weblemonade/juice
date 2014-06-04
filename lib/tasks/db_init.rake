namespace :db do

  desc "Raise an error unless the RAILS_ENV is development"
  task :dev_only do
    raise "You're not in development mode!" unless Rails.env == 'development' || Rails.env == 'test'
  end

  # task :kill_process do
  #   dbname = 'grand_central_development'
  #   connection = ActiveRecord::Base.connection
  #   connection.execute <<-SQL
  #     SELECT pg_terminate_backend(pg_stat_activity.pid)
  #     FROM pg_stat_activity
  #     WHERE pg_stat_activity.datname = '#{dbname}';
  #   SQL
  #   connection.execute "DROP DATABASE IF EXISTS #{quote_table_name('dbname')}"
  # end

  task :init => [:environment, :dev_only, :drop, :create, :migrate, :seed] do
  end

end

