class AddAddressAndMapImageToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :formatted_address, :string
    add_column :locations, :map_url, :string
  end
end
