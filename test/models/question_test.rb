require 'test_helper'

class QuestiontTest < ActiveSupport::TestCase
  def test_qiita_api
    user = User.create!(name: 'test', email: 'alice@example.com', password: 'password')
    question = user.questions.build(title: 'Railsについて', description: 'validationの使い方がわかりません')
    question.save!
    puts question.qiita_articles
  end
end
