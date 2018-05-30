require 'rails_helper'

describe WordService do
  it 'Returns information about a word when the word exists' do
    VCR.use_cassette('word_service_valid_word') do
      word = WordService.new('foxes').word_search

      expect(word[:results].first[:word]).to eq('foxes')
    end
  end

  context 'When the word is invalid' do
    it 'Returns an error message' do
      VCR.use_cassette('word_service_invalid_word') do
        word = WordService.new('foxez').word_search

        expect(word[:warning]).to eq('Error: This word does not exist')
      end
    end
  end
end
