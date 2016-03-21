require "date"
require "active_record"
require "open-uri"
require "nokogiri"
require "yaml"

gem "mysql2" , '~> 0.3.13'
require "mysql2"

module ColourPicker 
  def self.initialize
    environment = ENV['RACK_ENV'] || 'development'
    dbconfig = YAML.load(File.read('../config/database.yml'))
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection dbconfig[environment]
  end
  def self.go!
    initialize()
  end
  def self.get_target_site
  end
end
ColourPicker.go!
