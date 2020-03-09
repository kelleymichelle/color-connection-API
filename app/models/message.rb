class Message < ApplicationRecord

  validates :content, presence: true, length: { maximum: 10000 }
  belongs_to :sender, class_name: "User"
  belongs_to :reciever, class_name: "User"



  def self.conversation(user1, user2)
    where(sender_id: [user1.id, user2.id], reciever_id: [user1.id, user2.id]).order(created_at: :asc)
  end

end
