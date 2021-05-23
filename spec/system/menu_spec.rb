require 'rails_helper'

RSpec.describe 'Shop', type: :system do
  let!(:shops) { create_list(:shop, 3) }
  let!(:menus) { create_list(:menu, 5, shop: shops.first)}

  it 'menu list can be displayed' do
    visit root_path
    shop = shops.first
    click_on shop.name
    menus.each do |menu|
      expect(page).to have_css('.menu_name', text: menu.name)
    end
  end
end