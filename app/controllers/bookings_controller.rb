class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]



  def create
    @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to @booking, notice: "New booking was created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save!
      redirect_to @booking, notice: "Your booking was updated"
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
  end


  private
  def set_offer
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
