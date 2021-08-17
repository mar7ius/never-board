class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @game = Game.find(params[:game_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(params_bookings)
    authorize @booking
    if booking.save
      # redirect_to pages_dashboard_path()
    else
      render :new
    end
  end
  def update
    @booking.update(game_params)
    redirect_to booking_path(@booking)
  end

  private

  def params_bookings
    params.require(:booking).permit(:start_date, :end_date, :game_id, :user_id)
  end
end
