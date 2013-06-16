class RemoveLatitudeFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude
    remove_column :locations, :longitude
    remove_column :locations, :accuracy
    add_column :locations, :latitude, :string
    add_column :locations, :longitude, :string
    add_column :locations, :accuracy, :string
  end
end
