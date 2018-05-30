class Api::V1::PlaysController < ApplicationController
  before_action :word_check

  def create
    play = Play.new(play_params)
    play.game_id = params[:game_id].to_i
    play.save
    render json: play, status: :created
  end

  private
    def play_params
      params.require(:play).permit(:user_id, :word)
    end

    def word_check
      word = WordPresenter.new(play_params[:word]).word
      unless word.valid?
        render json: { message: "#{play_params[:word]} is not a valid word."},
                       status: 422
      end
    end
end
