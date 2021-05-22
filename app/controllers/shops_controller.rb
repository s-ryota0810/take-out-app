class ShopsController < ApplicationController
  before_action :load_shop, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  private

  def load_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :images, [] )
  end

end
