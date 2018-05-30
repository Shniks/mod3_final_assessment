require 'rails_helper'

describe 'As a user' do
  describe 'When I send a get request to /api/v1/games/1' do
    scenario 'I can see the details of my game' do
      VCR.use_cassette('get_game_details') do
        p1 = create(:user, name: 'Nikhil')
        p2 = create(:user, name: 'Sergio')
        game = Game.create(player_1: p1, player_2: p2)
        p1.plays.create(game: game, word: 'hello')
        p2.plays.create(game: game, word: 'bird')

        get "/api/v1/games/#{game.id}"

        game = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(game).to eq(game_response)
      end
    end
  end
end

def game_response
  {
  "game_id":1,
  "scores": [
    {
      "user_id":1,
      "score":15
    },
    {
      "user_id":2,
      "score":16
    }
  ]
}
end
