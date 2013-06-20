class AddUniqueUrlToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :unique_url, :string
  end
end
