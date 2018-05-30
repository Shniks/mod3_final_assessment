class Api::V1::PlaysController < ApplicationController
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
end
