class Memo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }

  scope :default_order, -> { order(created_at: :desc) }
end
