class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = policy_scope(Game)
  end

  def show
    authorize @game
  end

  def new
    authorize @game
    @games = Game.new
  end

  def create
    authorize @game
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to game_path
  end

  private

  def set_game
    @game = Game.find(params[:id])

  end

  def game_params
    params.require(:game).permit(:category, :address, :description, :price, photos: [])
  end
end
