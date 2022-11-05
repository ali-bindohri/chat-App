class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit {broadcast_append_to room}
  before_create :confirm_participent

  def confirm_participent
    return unless room.is_private
    
    is_Participant = Participant.where(user_id: user.id, room_id: room.id).first
    throw :abort unless is_Participant
  end
end
