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

  def edit
    @shop = Shop.find(params[:shop_id])
    @menu = @shop.menus.find(params[:id])
  end

  def update
    shop = Shop.find(params[:shop_id])
    @menu = shop.menus.find(params[:id])
    if @menu.update(menu_params)
      redirect_to shop_path(shop)
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    @menu = shop.menus.find(params[:id])
    @menu.destroy!
    redirect_to shop_path(shop)
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price)
  end

end
