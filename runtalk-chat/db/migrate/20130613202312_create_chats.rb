class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
