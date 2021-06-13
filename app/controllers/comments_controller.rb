class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    shop = Shop.find(params[:shop_id])
    comments = shop.comments
    render json: comments
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save!
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :star).merge(params.permit(:shop_id))
  end
end
