class RemoveAndAddNewChatId < ActiveRecord::Migration
  def change

    remove_column :invitations, :chat_id
    add_column :invitations, :chat_id, :string
  end
end
