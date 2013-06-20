class CreateInvitationsTable < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.string :user_email
      t.integer :chat_id
      t.timestamps
      
    end
    add_index :invitations, :user_id
    add_index :invitations, :chat_id
  end
end
