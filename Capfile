load 'deploy' if respond_to?(:namespace) # cap2 differentiator
 
logger.level = Logger::IMPORTANT               # make capistrano quiet by default!

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
#set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
#set :scm_verbose, true
set :use_sudo, false
set :keep_releases, 1

set :normalize_asset_timestamps, false			# disable asset timestamps update, since rails doesn't use these
 
ssh_options[:forward_agent] = true

server domain, :app, :web
 
after "deploy:update", "deploy:cleanup" 

set :copy_exclude, ['Capfile', 'README.md']

STDOUT.sync
before "deploy:setup" do
    print "Updating Rvm........"
    start_spinner()
end

after "deploy:setup" do
    stop_spinner()
    puts "Done."
end

before "deploy:update_code" do
    print "Updating Code........"
    start_spinner()
end

after "deploy:update_code" do
    stop_spinner()
    puts "Done."
end

before "deploy:cleanup" do
    print "Cleaning Up.........."
    start_spinner()
end

after "deploy:cleanup" do
    stop_spinner()
    puts "Done."
end

@spinner_running = false
@chars = ['|', '/', '-', '\\']
@spinner = Thread.new do
  loop do
    unless @spinner_running
      Thread.stop
    end
    print @chars[0]
    sleep(0.1)
    print "\b"
    @chars.push @chars.shift
  end
end

def start_spinner
  @spinner_running = true
  @spinner.wakeup
end

# stops the spinner and backspaces over last displayed character
def stop_spinner
  @spinner_running = false
  print "\b"
end
