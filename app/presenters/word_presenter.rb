class WordPresenter
  def initialize(word)
    @input_word = word
  end

  def word
    raw_word ||= WordService.new(@input_word).word_search
    result = raw_word[:results].first
    Word.new(word: result[:word], root: result[:lexicalEntries].first[:inflectionOf].first[:text])
  end
end
