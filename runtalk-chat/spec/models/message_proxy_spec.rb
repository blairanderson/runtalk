require 'spec_helper'

describe MessageProxy do

  let(:message) do 
    {
      content: "message",
      chat_id: 1,
      created_at: Time.now
    }
  end

  let(:subject) { MessageProxy.new(message) }

  its(:content) {message[:content]}
  its(:chat_id) {message[:chat_id]}

  describe '.build_location_for_chat' do 
    let(:location) do 
      {
        latitude: "39.733482200000005",
        longitude: "-104.9926124",
        accuracy: 2
      }
    end
    
    it 'should create a message that responds to location' do 
      LocationProxy.any_instance.stub(:build_address).and_return("address")
      message = MessageProxy.build_location_for_chat(location,1)
      expect(message.location).to be_kind_of LocationProxy
    end    
  end

end
