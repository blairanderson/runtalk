class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :message_id
      t.string :latitude
      t.string :longitude
      t.string :accuracy
      t.string :address
      t.string :map_url
      t.timestamps
    end
    add_index :locations, :message_id
  end
end
