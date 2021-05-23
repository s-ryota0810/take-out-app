require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:shop) { create(:shop) }
  let!(:comment) { create(:comment, user: user, shop: shop)}

  context 'if comment title is entered' do
    it 'The comment can be saved' do
      expect(comment).to be_valid
    end
  end

  context 'if comment title is not entered' do
    let!(:comment) { build(:comment, user: user, shop: shop, title: '') }

    before do
      comment.save
    end

    it 'The comment cannot be saved' do
      expect(comment.errors.messages[:title][0]).to eq("can't be blank")
    end
  end

  context 'if comment user info is not complete' do
    let!(:comment) { build(:comment, shop: shop) }

    before do
      comment.save
    end

    it 'The comment cannot be saved' do
      expect(comment.errors.messages[:user][0]).to eq('must exist')
    end
  end

  context 'if comment shop info is not complete' do
    let!(:comment) { build(:comment, user: user) }

    before do
      comment.save
    end

    it 'The comment cannot be saved' do
      expect(comment.errors.messages[:shop][0]).to eq('must exist')
    end
  end
end
