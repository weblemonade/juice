module Juice
  module Generators
    class InstallGenerator < Rails::Generators::Base

      # simple form complains on every method if it's not installed... so... lets do this first
      def install_simple_form
        generate "simple_form"
        copy_file 'simple_form_bootstrap.rb', 'config/initializers/simple_form_bootstrap.rb'
        # use juice form partial instead
        remove_file "lib/templates/slim/scaffold/_form.html.erb"
      end

      def install_rspec
        generate "rspec:install"
      end

      def cleanup_default_files
        remove_file "public/index.html"
        remove_file "app/assets/images/rails.png"
        remove_file "app/views/layouts/application.html.erb"
        # copy_file "initializer.rb", "config/initializers/juice.rb"
        copy_file "home_controller.rb", "app/controllers/home_controller.rb"
        copy_file "index.html.slim", "app/views/home/index.html.slim"
        copy_file "application.html.slim", "app/views/layouts/application.html.slim"
        copy_file "layout_helper.rb", "app/helpers/layout_helper.rb"
        copy_file "footer.html.slim", "app/views/layouts/_footer.html.slim"
        copy_file "nav_unauthenticated.html.slim", "app/views/layouts/_nav_unauthenticated.html.slim"
        copy_file "nav_authenticated.html.slim", "app/views/layouts/_nav_authenticated.html.slim"
        copy_file "styles.css.scss", "app/assets/stylesheets/styles.css.scss"
        copy_file "scaffolds.css.scss", "app/assets/stylesheets/scaffolds.css.scss"
        route "root :to => 'home#index'"
      end

      def setup_asssets
        insert_into_file "app/assets/javascripts/application.js", :after => "jquery_ujs\n" do
          "//= require bootstrap\n//= require initialize\n//= require forms\n"
        end
        insert_into_file "app/assets/stylesheets/application.css", :after => "*= require_tree .\n" do
          " *= require 'bootstrap'\n *= require 'font-awesome'\n"
        end
      end

      def setup_unicorn
        # copy_file 'unicorn.rb', 'config/unicorn/development.rb'
        copy_file 'unicorn.rb', 'config/unicorn/staging.rb'
        copy_file 'unicorn.rb', 'config/unicorn/production.rb'
      end

      def setup_deploy
        copy_file 'deploy.rb', 'config/deploy/staging.rb'
        copy_file 'deploy.rb', 'config/deploy/production.rb'
      end

      def setup_devise
        generate "devise:install"
        generate "devise User first_name:string last_name:string"
        route 'as :user do
          get "/login" => "devise/sessions#new"
          get "/logout" => "devise/sessions#destroy"
        end'
        copy_file "devise_new_session.html.slim", "app/views/devise/sessions/new.html.slim"
      end

      def setup_cancan
        generate "cancan:install"
      end

      def setup_git
        remove_file ".gitignore"
        copy_file 'gitignore.txt', '.gitignore'
      end

      def setup_sample_api
        directory 'api', 'app/api'
      end
      
    end
  end
end
