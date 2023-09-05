class Room < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  scope :default_order, -> { order(created_at: :desc) }
end
