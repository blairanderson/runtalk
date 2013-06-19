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
    message.chat_id = chat.id
    message.save
    message
  end

  def new_photo(overrides = {})
    defaults = {photo_url: "http://www.google.com/image.png"}
    Photo.new( defaults.merge(overrides) )
  end

  def create_photo(overrides = {})
    photo = new_photo(overrides)
    photo.save
    photo
  end



end
