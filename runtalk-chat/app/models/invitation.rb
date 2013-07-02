class Invitation

  attr_reader :phone_number, :chat_id, :user_id

  def initialize(params)
    @phone_number = params[:phone_number]
    @chat_id = params[:chat_id]
    @user_id = params[:user_id]
  end

end