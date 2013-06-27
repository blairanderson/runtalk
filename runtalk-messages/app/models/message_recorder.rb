class MessageRecorder

  def self.record(message)
    data = JSON.parse(message)
    puts message.inspect
    Message.create!(data)
  end

  def self.listen
    host.subscribe(:chat_message) do |subscription|
      subscription.message do |channel, item|
        puts "recording: #{item.inspect}"
        record(item)
      end
    end
  end

  def self.host
    @host ||= Redis.new
  end
end
