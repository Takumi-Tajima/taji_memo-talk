class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :reactions, dependent: :destroy
  
  BAD_WORDS = ["死ね", "クソ", "馬鹿", "バカ", "しね", "あほ", "アホ", "キモい", "キモ"].freeze
  before_save :filter_bad_words
  
  validates :content, presence: true, length: {maximum: 200} 
  
  def user_name
    user = User.find(self.user_id)
    user.name
  end
  
  def reacted_by?(user) 
    reactions.exists?(user_id: user.id) 
  end

  private
  
  def filter_bad_words
    words = content.split(' ')
    words.map! do |word|
      BAD_WORDS.include?(word) ? '😀' * word.length : word
    end

    self.content = words.join(' ')
  end
end
