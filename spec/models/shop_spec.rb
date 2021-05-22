require 'rails_helper'

RSpec.describe Shop, type: :model do
  it 'shop info can be saved if shop name is entered' do
    shop = Shop.new(
      name: 'test'
    )
    
    expect(shop).to be_valid
  end
end
