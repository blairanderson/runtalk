require 'spec_helper'

describe Chat do

  describe 'validations' do 
    it 'should always use lowercase characters in slug'
    it 'cannot have symbols in slug'
  end
  
  it 'object path should use slug instead of id' do 
    chat = Chat.create(name: "funny", slug: "funny")
    expect(chat.to_param).to eq "funny"
  end
end
