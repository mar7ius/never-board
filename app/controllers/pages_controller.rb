class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @games = Game.order('updated_at DESC').limit(4)
  end

  def dashboard
    # @pages = Page.find(params[:id])
    @games = Game.where(user: current_user)
    @bookings = Booking.where(user: current_user)

  end
end
