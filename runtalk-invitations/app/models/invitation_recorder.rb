class InvitationRecorder

  def self.record(message)
    data = JSON.parse(message).with_indifferent_access

    invitation = Invitation.create!(data).send_text
  end

  def self.listen
    host.subscribe(:send_invitation) do |subscription|
      subscription.message do |channel, item|
        record(item)
      end
    end
  end

  def self.host
    @host ||= Redis.new
  end
end