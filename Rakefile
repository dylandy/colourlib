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
    target = YAML::load_file("#{File.dirname(__FILE__)}/config/target.yml")
    #initial new element
    target["target#{(target.count).to_s}"] = {}
    #put data into target
    target["target#{(target.count - 1).to_s}"]["sitename"] = site_name
    target["target#{(target.count - 1).to_s}"]["url"] = site_url
    File.open("#{File.dirname(__FILE__)}/config/target.yml", 'w') {|f| f.write target.to_yaml }
  end
end
