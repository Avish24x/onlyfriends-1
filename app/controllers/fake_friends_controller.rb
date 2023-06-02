class FakeFriendsController < ApplicationController
  before_action :set_fake_friend, only: %i[show edit destroy update]

  def index
    @fake_friends = FakeFriend.all

    if params[:query_category].present?
      sql_subquery = <<~SQL
        categories.name ILIKE :query_category
      SQL
      @fake_friends = @fake_friends.joins(:categories).where(sql_subquery, query_category: "%#{params[:query_category]}%")
    end

    @fake_friends = @fake_friends.where("main_description ILIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  def new
    @fake_friend = FakeFriend.new
  end

  def create
    @fake_friend = FakeFriend.new(fake_friend_params)
    @fake_friend.user = current_user
    @fake_friend.rating = 0
    if @fake_friend.save
      categories_params[:categories].compact.each { |category_id| Tag.create(fake_friend: @fake_friend, category_id: category_id) }
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
    if @fake_friend.update(fake_friend_params)
      redirect_to fake_friend_path(@fake_friend)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fake_friend.destroy
    redirect_to fake_friends_path, status: :see_other
  end

  private

  def fake_friend_params
    params.require(:fake_friend).permit(:name, :gender, :age, :address, :main_description, :price, :photo)
  end

  def categories_params
    params.require(:fake_friend).permit(categories: [])
  end

  def set_fake_friend
    @fake_friend = FakeFriend.find(params[:id])
  end
end
