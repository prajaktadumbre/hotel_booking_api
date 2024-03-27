class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]
  def index
    if params[:user_id].present?
      bookings = Booking.where(user_id: params[:user_id]).includes(:room)
    else
      bookings = Booking.includes(:room)
    end
    render json: bookings
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render json: booking, status: :created
    else
      render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_rooms, :room_id, :user_id)
  end
end