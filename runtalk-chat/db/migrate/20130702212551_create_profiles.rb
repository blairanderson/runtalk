class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name 
      t.string  :email
      t.integer :user_id

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
