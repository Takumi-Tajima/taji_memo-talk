class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :content, presence: true, length: {maximum: 200} 
  
  def user_name
    user = User.find(self.user_id)
    user.name
  end
end
