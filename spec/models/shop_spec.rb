require 'rails_helper'

RSpec.describe Shop, type: :model do
  context 'If a store name is entered' do
    let!(:shop) { build(:shop) }

    it 'shop info can be saved' do
      expect(shop).to be_valid
    end
  end

  context 'If a store name is not entered' do
    let!(:shop) { build(:shop, name: '') }

    before do
      shop.save
    end

    it 'shop info can not be saved' do
      expect(shop.errors.messages[:name][0]).to eq("can't be blank")
    end
  end
end
