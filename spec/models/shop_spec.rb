require 'rails_helper'

RSpec.describe Shop, type: :model do
  context 'If a store name is entered' do
    before do
      @shop = Shop.new(
        name: 'test'
      )
    end

    it 'shop info can be saved' do
      expect(@shop).to be_valid
    end
  end
end
