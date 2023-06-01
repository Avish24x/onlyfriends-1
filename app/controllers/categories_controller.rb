class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @fake_friends = FakeFriend.all
  end

  def show
  end

  def method_name
    
  end
end
