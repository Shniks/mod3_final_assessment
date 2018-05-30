class WordPresenter
  def initialize(word)
    @input_word = word
  end

  def word
    raw_word ||= WordService.new(@input_word).word_search
  end
end
