class AddPhoneNumberToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :phone_number, :string
    remove_column :invitations, :user_email
  end
end
