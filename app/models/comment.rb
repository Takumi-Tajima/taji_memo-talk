class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :reactions, dependent: :destroy
  
  validates :content, presence: true, length: {maximum: 200} 
  
  def user_name
    user = User.find(self.user_id)
    user.name
  end
  
  def reacted_by?(user) 
    reactions.exists?(user_id: user.id) 
  end

end
