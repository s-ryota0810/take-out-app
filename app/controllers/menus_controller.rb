class MenusController < ApplicationController
  
  def new
    @shop = Shop.find(params[:shop_id])
    @menu = @shop.menus.build
  end
  
  def create
    shop = Shop.find(params[:shop_id])
    @menu = shop.menus.create(menu_params)
    if @menu.save
      redirect_to shop_path(shop)
    else
      render :new
    end
  end
  
  private
  
  def menu_params
    params.require(:menu).permit(:name, :price)
  end

end