class AddColumnArtist < ActiveRecord::Migration
  def change
    add_column :items , :artist , :string
  end
end
