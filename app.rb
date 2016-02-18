require 'json'
require_relative 'lib/sentiment_analysis'

before do
  begin
    request.body.rewind
    @json = JSON.parse(request.body.read)
  rescue JSON::ParserError
    # This is for the empty/non-json request body
    nil
  end
end

get '/' do
  redirect '/index.html'
end

post '/sentiment' do
  score = SentimentAnalysis.new(@json['content']).score
  [200, {}, {score: score}.to_json]
end
