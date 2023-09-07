class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
  before_save :filter_bad_words
  
  scope :default_order, -> { order(created_at: :desc) }
  
  BAD_WORDS = ["死ね", "クソ", "馬鹿", "バカ", "しね", "あほ", "アホ", "キモい", "キモ"].freeze

  private

  def filter_bad_words
    if title.present?
      
      BAD_WORDS.each do |word|
        title.gsub!(word, '😀' * word.length) if title.include?(word)
      end
    end

    if description.present?
      words = description.split(' ')
      words.map! do |word|
        BAD_WORDS.include?(word) ? '😀' * word.length : word
      end

      self.description = words.join(' ')
    end
  end
end
