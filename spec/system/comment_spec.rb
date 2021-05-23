require 'rails_helper'

RSpec.describe 'Comment', type: :system do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop) }
  let!(:comments) { create_list(:comment, 3, shop: shop, user: user) }

  it 'comment list can be displayed' do
    visit shop_path(shop)
    comments.each do |comment|
      expect(page).to have_css('.show_comment_title', text: comment.title)
    end
  end
end
