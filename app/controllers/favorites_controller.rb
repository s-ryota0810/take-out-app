class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def show
    shop = Shop.find(params[:shop_id])
    favorite_status = current_user.has_favorited?(shop)
    render json: { hasFavorited: favorite_status }
  end

  def create
    shop = Shop.find(params[:shop_id])
    shop.favorites.create!(user_id: current_user.id)
    render json: { status: 'ok' }
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    favorite = shop.favorites.find_by(user_id: current_user.id)
    favorite.destroy!
    render json: { status: 'ok' }
  end

  def index
    @favorites = current_user.favorites
  end
end
