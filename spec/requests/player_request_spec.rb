require 'rails_helper'

describe 'As a user' do
  describe 'When I send a post request to /api/vi/games/1/plays' do
    scenario 'It creates a play' do
      VCR.use_cassette('post_game_play') do
        game = create(:game)
        data = {user_id: game.player_1.id, word: 'Turing'}
        post "/api/v1/games/#{game.id}/plays", params: {play: data}

        play = Play.last

        expect(response.status).to eq(201)
        expect(play.user_id).to eq(game.player_1.id)
        expect(play.word).to eq('Turing')
      end
    end
  end

  # Everything the same as above but it only allows valid words to be played. If an invalid word is played the response is:
  # {"message": "foxez is not a valid word."}

  context 'When an invalid word is sent' do
    scenario 'I get an error message' do
      VCR.use_cassette('post_game_play_invalid_word') do
        game = create(:game)
        data = {user_id: game.player_1.id, word: 'foxez'}
        post "/api/v1/games/#{game.id}/plays", params: {play: data}

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)["message"]).to eq("foxez is not a valid word.")
      end
    end
  end
end
