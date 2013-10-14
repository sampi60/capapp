set :application, "capapp"
set :user, "sampi"
set :deploy_to, "/home/#{user}/www/#{application}"

set :scm, :git
set :repository, "git@code.gumed.edu.pl:#{user}/#{application}.git"
set :branch, 'cap2'

set :use_sudo, false
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache


set :domain, "ssh.alwaysdata.com"
server domain, :app, :web
role :db, domain, :primary => true
set :runner, user
set :keep_releases, 5


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
