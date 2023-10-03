class Comment < ApplicationRecord
  include BadWordsFilter
  belongs_to :user
  belongs_to :room
  has_many :reactions, dependent: :destroy
  before_save :set_filtered_bad_comment
  validates :content, presence: true, length: { maximum: 200 }

  def user_name
    user.name
  end

  def reacted_by?(user)
    reactions.exists?(user_id: user.id)
  end

  private

  def set_filtered_bad_commment
    self.content = filter_bad_words(content)
  end
end
