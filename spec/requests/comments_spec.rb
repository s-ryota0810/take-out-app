require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop) }

  describe "GET /shops/:shop_id/comments/new" do
    context 'if user sign in' do
      before do
        sign_in user
      end
      it 'return status 200' do
        get new_shop_comment_path(shop)
        expect(response).to have_http_status(200)
      end
    end
    
    context 'if user not sign in' do
      it 'return status 302' do
        get new_shop_comment_path(shop)
        expect(response).to have_http_status(302)
      end      
    end
  end
  
  describe 'POST /shops/:shop_id/comments' do
    context 'if user sign in' do
      before do
        sign_in user
      end
      it 'comment can be saved' do
        comment_params = attributes_for(:comment, shop: shop)
        post shop_comments_path(shop, comment: comment_params)
        expect(response).to have_http_status(302)
        expect(Comment.last.title).to eq(comment_params[:title])
      end
    end
  end
end
