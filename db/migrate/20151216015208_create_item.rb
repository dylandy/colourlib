class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :colour_id
    end
  end
end
