# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

#Added url for crawling
namespace :colourlib do
  task :add do
    STDOUT.print "sitename:"
    site_name = STDIN.gets.chomp
    STDOUT.print "url for #{site_name}:"
    site_url = STDIN.gets.chomp
    STDOUT.puts "#{site_name} = #{site_url}"
  end
end
