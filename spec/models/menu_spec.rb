require 'rails_helper'

RSpec.describe Menu, type: :model do
  let!(:shop) { create(:shop) }

  context 'if menu name is entered' do
    let!(:menu) { build(:menu, shop: shop)}
    it 'menu can be saved' do
      expect(menu).to be_valid
    end
  end

  context 'if menu name is not entered' do
    let!(:menu) { build(:menu, name: '', shop: shop) }

    before do
      menu.save
    end

    it 'menu can not be saved' do
      expect(menu.errors.messages[:name][0]).to eq("can't be blank")
    end
  end

  context 'if menu info is not connected to the shop info' do
    let!(:menu) { build(:menu) }

    before do
      menu.save
    end

    it 'menu can not be saved' do
      expect(menu.errors.messages[:shop][0]).to eq('must exist')
    end
  end
end
