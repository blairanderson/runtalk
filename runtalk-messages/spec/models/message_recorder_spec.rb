require 'spec_helper'

describe MessageRecorder do 
  
  it 'records the message' do 
    message = {
      content: "some content",
      chat_id: 1
    }.to_json
    expect { MessageRecorder.record(message) }.to change(Message, :count).by(1)

  end
end
