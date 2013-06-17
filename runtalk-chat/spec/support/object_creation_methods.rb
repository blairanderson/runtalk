module ObjectCreationMethods

  def new_chat(overrides = {})
    defaults = {
      name: "Valid Name",
      slug: "validslug"
    }
    Chat.new( defaults.merge(overrides) )
  end

  def create_chat(overrides = {})
    chat = new_chat(overrides)
    chat.save
    chat
  end

  def new_message(overrides = {})
    defaults = {content: "Valid Name"}
    Message.new( defaults.merge(overrides) )
  end

  def create_message(overrides = {})
    message = new_message(overrides)
    message.save
    message
  end

end
