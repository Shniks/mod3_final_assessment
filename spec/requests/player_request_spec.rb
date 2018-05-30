require 'rails_helper'

describe 'As a user' do
  describe 'When I send a post request to /api/vi/games/1/plays' do
    scenario 'It creates a play' do
      VCR.use_cassette('post_game_play') do
        game = create(:game)
        data = {user_id: game.player_1.id, word: 'foxes'}
        post "/api/v1/games/#{game.id}/plays", params: {play: data}

        play = Play.last

        expect(response.status).to eq(201)
        expect(play.user_id).to eq(game.player_1.id)
        expect(play.word).to eq('foxes')
      end
    end
  end
