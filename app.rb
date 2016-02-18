require 'json'
require_relative 'lib/sentiment_analysis'

before do
  request.body.rewind
  @json = JSON.parse(request.body.read)
end

post '/sentiment' do
  score = SentimentAnalysis.new(@json['content']).score
  [200, {}, {score: score}.to_json]
end
