class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @my_bookings = Booking.all.select do |booking|
      booking.user.id == current_user.id || booking.island.user.id == current.user.id
    end

    return if @my_bookings.empty?

    @my_active_bookings = @my_bookings.select(&:active?) # same as { |b| b.active? }
    @my_previous_bookings = @my_bookings.select { |b| b.active? == false }
  end

  def show
  end

  def new
    @island = Island.find(params[:island_id])
    @booking = Booking.new
    @booking.start_date = Date.tomorrow
    @booking.end_date = Date.tomorrow + 1
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.island = Island.find(params[:island_id])
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
