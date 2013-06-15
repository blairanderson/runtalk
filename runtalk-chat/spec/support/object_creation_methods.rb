module ObjectCreationMethods
  def create_chat(overrides = {})
    defaults = {
      name: "Valid Name",
      slug: "validslug"
    }
    Chat.create(defaults.merge(overrides))
  end

end
