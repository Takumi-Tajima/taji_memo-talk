class Answer < ApplicationRecord
  belongs_to :question
  validates :description, presence: true
  
  scope :default_order, -> { order(created_at: :desc) }
end
