require 'rails_helper'

RSpec.describe 'Shop', type: :system do
  let!(:user) { create(:user) }
  let!(:shops) { create_list(:shop, 3) }
  let!(:menus) { create_list(:menu, 5, shop: shops.first)}
  
  it 'shop list can be displayed' do
    visit root_path
    shops.each do |shop|
      expect(page).to have_css('.shop_info_name', text: shop.name)
    end
  end
  
  it 'shop detail info can be displayed' do
    visit root_path
    shop = shops.first
    click_on shop.name
    expect(page).to have_css('.shop_detail_name', text: shop.name)
  end
  
  it 'menu list can be displayed' do
    visit root_path
    shop = shops.first
    click_on shop.name
    menus.each do |menu|
      expect(page).to have_css('.menu_name', text: menu.name)
    end
  end
end