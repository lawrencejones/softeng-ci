require 'rspec'
require_relative '../../lib/sentiment_analysis'

RSpec.describe(SentimentAnalysis) do
  subject(:analysis) { SentimentAnalysis.new(content) }

  describe '.score' do
    subject { analysis.score }
    context 'negative content' do
      let(:content) { 'I hate ruby and softeng' }

      it { is_expected.to be < 0 }
    end

    context 'positive content' do
      let(:content) { 'I love ruby and softeng' }

      it { is_expected.to be > 0 }

      context 'with punctuation' do
        let(:content) { 'I !love! ruby' }

        it { is_expected.to be > 0 }
      end
    end
  end
end
