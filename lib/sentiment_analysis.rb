class SentimentAnalysis
  def initialize(content)
    @content = content
  end

  def score
    @score ||= compute_sentiment
  end

  private

  def compute_sentiment
    words.reduce(0.0) do |a, c|
      return a - 1.0 if c =~ /^(hate|awful|terrible|horrific|unspeakable|heinous|monstrous)$/
      return a - 0.5 if c =~ /^(bad|unpleasant)$/
      return a + 0.5 if c =~ /^(good|nice)$/i
      return a + 1.0 if c =~ /^(excellent|love|super|marvellous|wonderful|mind-blowing)$/

      a
    end / words.count
  end

  def words
    @words ||= @content.split.freeze
  end
end
