class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.decimal :accuracy, {:precision=>10, :scale=>6}
      t.integer :message_id

      t.timestamps
    end
    add_index :locations, :message_id
  end
end
