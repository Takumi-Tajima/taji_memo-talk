class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
  scope :default_order, -> { order(created_at: :desc) }
  
  attr_accessor :qiita_articles
  
  def search_qiita_and_associate
    qiita_search_results = search_qiita(self.title)
    associate_qiita_results(qiita_search_results)
  end
  
  private

  def search_qiita(query)
    qiita_api_endpoint = "https://qiita.com/api/v2/items"
    api_token = ENV['QIITA_API_TOKEN']

    uri = URI(qiita_api_endpoint)
    params = { 'q' => query }
    uri.query = URI.encode_www_form(params)
  
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
  
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = "Bearer #{api_token}"
  
    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      []
    end
  end

  def associate_qiita_results(qiita_results)
    qiita_articles = []
  
    qiita_results.each do |qiita_result|
      qiita_article = {
        title: qiita_result['title'],
        url: qiita_result['url'],
      }
  
      qiita_articles << qiita_article
    end
  
    self.qiita_articles = qiita_articles
  end
end