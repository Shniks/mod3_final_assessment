class WordPresenter
  def initialize(word)
    @input_word = word
  end

  def word
    raw_word
  end

  private

    def raw_word
      raw_word ||= WordService.new(@input_word).word_search
      check_word(raw_word)
    end

    def check_word(raw_word)
      if raw_word.keys.include?(:warning)
        Word.new(word: @input_word)
      else
        result = raw_word[:results].first
        Word.new(word: result[:word], root: result[:lexicalEntries].first[:inflectionOf].first[:text])
      end
    end
end
