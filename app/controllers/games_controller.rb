class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = policy_scope(Game)
  end

  def show
    authorize @game
  end

  def new
    @game = Game.new
    authorize @game
    @text = "Add your game"
  end

  def create
    @game = Game.new(game_params)
    authorize @game
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    authorize @game
    @text = "Edit your game"
  end

  def update
    @game.update(game_params)
    authorize @game
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    authorize @game
    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:category, :address, :description, :available, :price, photos: [])
  end
end
