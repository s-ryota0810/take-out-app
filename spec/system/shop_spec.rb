require 'rails_helper'

RSpec.describe 'Shop', type: :system do
  let!(:user) { create(:user) }
  let!(:shops) { create_list(:shop, 3) }

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
end
