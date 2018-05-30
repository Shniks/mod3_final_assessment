class SearchController < ApplicationController
  def index
    @word = WordPresenter.new(params[:q]).word 
  end
end
