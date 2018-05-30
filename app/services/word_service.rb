class WordService
  def initialize(word)
    @word = word
    @conn = Faraday.new('https://od-api.oxforddictionaries.com/api/v1')
  end

  def word_search
    get_json("inflections/en/#{@word}")
  end

  private
    attr_reader :conn, :word

    def get_json(url)
      response ||= conn.get(url) do |request|
        request.headers['app_id']   = ENV['APP_ID']
        request.headers['app_key']  = ENV['APP_KEY']
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
