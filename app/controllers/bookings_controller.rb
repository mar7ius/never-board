class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_bookings)
    @game = Game.find(params[:game_id])
    @booking.game = @game
    @booking.user = current_user
    authorize @booking

    if @booking.save
      flash[:alert] = "Your game has been booked"
      redirect_to pages_dashboard_path
    else
      flash[:alert] = "Booking unsuccessful"
      redirect_to game_path(@game)
    end
  end

  def update
    @booking.update(game_params)
    redirect_to booking_path(@booking)
  end


  private

  def set_game
    @game = Game.find(params[:id])
  end

  def params_bookings
    params.require(:booking).permit(:start_date, :end_date, :game_id, :user_id)
  end
end
