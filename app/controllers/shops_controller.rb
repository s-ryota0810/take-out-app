class ShopsController < ApplicationController
  
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path, notice: '店舗情報を登録しました'
    else
      flash.now[:error] = '登録できませんでした'
      render :new
    end
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name)
  end

end