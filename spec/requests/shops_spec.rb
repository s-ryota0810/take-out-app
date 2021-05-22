require 'rails_helper'

RSpec.describe "Shops", type: :request do
  let!(:user) { create(:user) }
  let!(:shops) { create_list(:shop, 5) }

  describe "GET /shops" do
    it "return status 200" do
      get shops_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST /shops" do
    context 'if user sign in' do
      before do
        sign_in user
      end
      
      it "shop info can be save" do
        shop_params = attributes_for(:shop)
        post shops_path(shop: shop_params)
        expect(response).to have_http_status(302)
        expect(Shop.last.name).to eq(shop_params[:name])
      end        
    end
  end
end
