require 'rails_helper'

RSpec.describe 'Shop', type: :system do
  let!(:user) { create(:user) }
  let!(:shops) { create_list(:shop, 3) }
  
  it 'shop list can be displayed' do
    visit root_path
    shops.each do |shop|
      expect(page).to have_content(shop.name)
    end
  end
end