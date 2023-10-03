class Answer < ApplicationRecord
  include BadWordsFilter
  belongs_to :question
  validates :description, presence: true
  before_save :set_filtered_bad_answer

  scope :default_order, -> { order(created_at: :desc) }

  private

  def set_filtered_bad_answer
    self.description = filter_bad_words(description)
  end
end
