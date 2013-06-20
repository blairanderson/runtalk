class AddUrlToPhoto < ActiveRecord::Migration
  def change
    rename_column :photos, :filepicker_url, :photo_url
  end
end
