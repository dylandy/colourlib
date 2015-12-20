require "date"
require "active_record"
require "open-uri"
require "nokogiri"
require "yaml"
require "miro"

gem "mysql2" , '~> 0.3.13'
require "mysql2"

class Item < ActiveRecord::Base ;end
class Colour < ActiveRecord::Base ;end

module StaticPicker 
  def self.initialize
    environment = ENV['RACK_ENV'] || 'development'
    dbconfig = YAML.load(File.read('../config/database.yml'))
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection dbconfig[environment]
  end
  def self.go!
    initialize()
    get_picture()
  end
  def self.get_picture
    img_folder_path = "../public/static-image/"
    `ls #{img_folder_path}`.split("\n").each do |i|
      if Item.where(:name => i.split("-").last.split(".").first.split("_").join(" ")).empty?
        image = Miro::DominantColors.new( img_folder_path.clone << i )
        colour_list = image.to_hex
        5.times do |index|
          item = Item.new
          item.name = i.split("-").last.split(".").first.split("_").join(" ")
          item.artist = i.split("-").first.split("_").join(" ") 
          if Colour.where(:colour_value => colour_list[index]).empty?
            colour = Colour.new
            colour.colour_value = colour_list[index]
            colour.save
          end
          item.colour_id = Colour.where(:colour_value => colour_list[index]).first.id
          item.save
        end
      end
    end 
  end
end
StaticPicker.go!
