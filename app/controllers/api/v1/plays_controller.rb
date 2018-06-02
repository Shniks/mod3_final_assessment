class Api::V1::PlaysController < ApplicationController
  before_action :word_check

  def create
    game = Game.find(params[:game_id])
    play = game.plays.new(play_params)
    game.plays.last.score = play.score
    game.save
    render json: play, status: :created
  end

  private
    def play_params
      params.require(:play).permit(:user_id, :word)
    end

    def word_check
      word = WordPresenter.new(play_params[:word]).word
      check_if_word_valid(word)
    end

    def check_if_word_valid(word)
      unless word.valid?
        render json: { message: "#{play_params[:word]} is not a valid word."},
        status: 422
      end
    end
end
