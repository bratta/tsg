set :application, "tsg"
set :repository, "git@github.com:bratta/tsg.git"
set :scm, "git"
set :user, "tim"
set :group, "tim"
set :runner, "tim"

set :branch, "master"  # or origin/master if this doesn't work
set :keep_releases, 5

set :deploy_via, :remote_cache

set :git_shallow_clone, 1

set :deploy_to, "/data/#{application}"
set :deploy_path, "#{deploy_to}/current"
set :shared_path, "#{deploy_to}/shared"

# Set this so the password prompt comes up ok
default_run_options[:pty] = true


# PRODUCTION
set :location, "timgourley.com"
role :app, location
role :web, location
role :db,  location, :primary => true

desc "Create shared symbolic links"
task :create_shared_symlinks do
  run "ln -s #{shared_path}/config/database.yml #{deploy_path}/config/database.yml"
  run "ln -s #{shared_path}db #{deploy_path}/db"
end

namespace :deploy do
  
  desc "Restart the application" 
  task :restart, :roles => :app do
    run "touch #{deploy_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup" 
after "deploy", "create_shared_symlinks"