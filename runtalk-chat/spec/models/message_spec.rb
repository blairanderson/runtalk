require 'spec_helper'

describe Message do
  describe 'validations' do 
    it 'must have content' do 
      message = Message.new(content: "valid")
      message.chat_id = 1
      expect(message).to be_valid

      message.content = nil
      expect(message).to be_invalid 
    end

    it 'must be attached to chat' do 
      message = Message.new(content: "valid")
      expect(message.save).to be_false
    end
  end
end
