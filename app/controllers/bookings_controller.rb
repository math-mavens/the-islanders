class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy put patch]

  def index
    @my_bookings = Booking.all.order('updated_at DESC').select do |booking|
      booking.user.id == current_user.id || booking.island.user.id == current_user.id
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
    @booking.start_date = Date.today
    @booking.end_date = Date.tomorrow
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @island = Island.find(params[:island_id])
    @booking.island = @island
    if @booking.valid?
      @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    status = params[:status]
    @booking.status = status
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def put
    raise
  end

  def patch
    raise
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
