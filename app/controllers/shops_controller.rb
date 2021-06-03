class ShopsController < ApplicationController
  before_action :load_shop, only: [:show, :edit, :update]
  before_action :load_areas, :load_genres, only: [:new, :edit]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop, notice: '店舗情報を登録しました'
    else
      flash.now[:error] = '登録できませんでした'
      render :new
    end
  end

  def show
    @menus = @shop.menus
    @comments = @shop.comments
    gon.shop = @shop
  end

  def edit
  end

  def update
    @shop.assign_attributes(shop_params)
    if @shop.save
      redirect_to @shop, notice: '店舗情報を更新しました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy!
    redirect_to root_path, notice: '店舗情報を削除しました'
  end
  
  def search
    @results = @q.result
    @search_word = @q.name_or_address_cont
  end

  private
  
  def load_areas
    @areas = Area.all
  end
  
  def load_genres
    @genres = Genre.all
  end

  def load_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :area_id, :genre_id, :images, [] )
  end

  def authenticate_admin
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path, alert: '権限エラーです'
    end
  end
  
  def set_q
    @q = Shop.ransack(params[:q])
  end
end
