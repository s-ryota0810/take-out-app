require 'rails_helper'

RSpec.describe "Shops", type: :request do
  let!(:shops) { create_list(:shop, 5) }
  describe "GET /shops" do
    it "return status 200" do
      get shops_path
      expect(response).to have_http_status(200)
    end
  end
end
