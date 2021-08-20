class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @games = Game.order('updated_at DESC').limit(4)
    if params[:query].present?
      @games = Game.where(title: params[:query])
    else
      @games = Game.all
    end
  end

  def dashboard
    # @pages = Page.find(params[:id])
    @games = Game.where(user: current_user)
    @bookings_i_made = Booking.where(user: current_user)
    @bookings_for_my_games = Booking.joins(:game).where(games: { user: current_user })
  end
end
