class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
  scope :default_order, -> { order(created_at: :desc) }
end