module BadWordsFilter
  BAD_WORDS = %w[死ね クソ 馬鹿 バカ しね あほ アホ キモい キモ].freeze

  def filter_bad_words(text)
    return unless text.present?

    words = text.split(' ')
    words.map! do |word|
      BAD_WORDS.include?(word) ? '😀' * word.length : word
    end
    words.join(' ')
  end
end
