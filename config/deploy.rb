default_run_options[:pty] = true
set :application, "inspire"
set :repository,  "git@git.hagenburger-gmbh.de:inspire.git"
set :scm, "git"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :domain, "hagenburger.net"
set :user, "susuh-deploy"
set :git_enable_submodules, true

set :branch, "master"
set :deploy_via, :remote_cache

set :deploy_to, "/var/proj/#{application}"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

desc 'start'
deploy.task :start, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end

desc 'restart'
deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end

after 'deploy:finalize_update', :roles => :app do
  run "cd #{release_path} && git submodule init"
  run "cd #{release_path} && git submodule update"
  run "ln -s #{shared_path}/config/database.yml      #{release_path}/config/database.yml"
  run "ln -s #{shared_path}/db/production.sqlite3    #{release_path}/db/production.sqlite3"
  run "touch #{current_path}/tmp/restart.txt"
end
