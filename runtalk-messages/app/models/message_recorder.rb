class MessageRecorder

  def self.record(message)
    data = JSON.parse(message)
    Message.create(data)      
  end

  def self.listen
    host.subscribe(:chat_messages) do |subscription|
      subscription.message do |channel, item|
        record(item)
      end
    end
  end

  def self.host
    @host ||= Redis.new
  end
end
