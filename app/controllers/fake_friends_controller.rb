class FakeFriendsController < ApplicationController
  before_action :set_fake_friend, only: %i[show edit destroy update]

  def index
    @fake_friends = FakeFriend.all
  end

  def new
    @fake_friend = FakeFriend.new
  end

  def create
    @fake_friend = FakeFriend.new(fake_friend_params)
    @fake_friend.user = current_user
    @fake_friend.rating = 0
    if @fake_friend.save
      redirect_to fake_friend_path(@fake_friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
  end

  def edit; end

  def update
    @fake_friend.update(fake_friend_params)
    redirect_to fake_friend_path(@fake_friend)
  end

  def destroy
    @fake_friend.destroy
    redirect_to fake_friends_path, status: :see_other
  end

  private

  def fake_friend_params
    params.require(:fake_friend).permit(:name, :gender, :age, :address, :main_description)
  end

  def set_fake_friend
    @fake_friend = FakeFriend.find(params[:id])
  end
end
