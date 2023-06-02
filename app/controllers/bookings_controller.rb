class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @fake_friend = FakeFriend.find(params[:fake_friend_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.fake_friend = @fake_friend

    @booking.total_price = 0
    @booking.total_price = (@fake_friend.price * (@booking.booking_end - @booking.booking_start)) / 3600

    @booking.save
    redirect_to bookings_index_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end, :total_price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
