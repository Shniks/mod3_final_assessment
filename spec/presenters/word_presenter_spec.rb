require 'rails_helper'

describe WordPresenter do
  it 'Converts json to a word object' do
    VCR.use_cassette('word_presenter_word_object') do
      input = 'foxes'
      word = WordPresenter.new(input).word

      expect(word.word).to eq('foxes')
      expect(word.root).to eq('fox')
    end
  end

  context 'Invalid word' do
    it 'Returns the invalid word' do
      VCR.use_cassette('word_presenter_invalid_word') do
        input = 'foxez'
        word = WordPresenter.new(input).word

        expect(word.word).to eq('foxez')
        expect(word).to_not be_valid
      end
    end
  end
end
