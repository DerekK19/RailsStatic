load 'deploy' if respond_to?(:namespace) # cap2 differentiator
 
default_run_options[:pty] = true
 
# be sure to change these
set :github_user, 'DerekK19'
set :github_application, "RailsStatic"
set :user, 'derek'
set :domain, 'localhost'
set :application, 'static'
 
# the rest should be good
set :repository,  "git@github.com:#{github_user}/#{github_application}.git"
set :deploy_to, "/Users/Shared/Sites/Rails/#{application}"  # or whatever path you want to copy it to
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false
 
ssh_options[:forward_agent] = true

server domain, :app, :web
 
# xbit is a script that runs chmod +x on all html files 
# because the site uses server side includes
#namespace :deploy do
#  task :xbit do
#      run "cd /var/apps/#{application}/current; ../xbit"
#  end
#end