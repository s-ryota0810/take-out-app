class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    shop = Shop.find(params[:shop_id])
    favorite_status = current_user.has_favorited?(shop)
    render json: { hasFavorited: favorite_status }
  end
  
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
  
  def index
    @favorites = current_user.favorites
  end
end