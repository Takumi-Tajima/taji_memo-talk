class Room < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  scope :default_order, -> { order(created_at: :desc) }
end
