class WordService
  def initialize(word)
    @word = word
    @conn = Faraday.new('https://od-api.oxforddictionaries.com/api/v1')
  end

  def word_search
    get_json("inflections/en/#{@word}")
  end

  def get_json(url)
    response ||= conn.get(url) do |request|
    end
    binding.pry
  end

  private
    attr_reader :word, :conn
end
