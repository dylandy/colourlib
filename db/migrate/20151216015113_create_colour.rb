class CreateColour < ActiveRecord::Migration
  def change
    create_table :colours do |t|
      t.string  :colour_value
    end
  end
end
