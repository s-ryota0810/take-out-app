class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @favorite = current_user.favorites.build
    @favorite.shop_id = params[:shop_id]
    @favorite.save!
    redirect_to @favorite.shop
  end
  
  def destroy
    @shop = Shop.find(params[:shop_id])
    @favorite = @shop.favorites.find_by(user_id: current_user.id)
    @favorite.destroy!
    redirect_to @shop
  end
end