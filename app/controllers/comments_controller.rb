class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @shop = Shop.find(params[:shop_id])
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      redirect_to shop_path(@comment.shop), notice: 'コメントを投稿しました'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :star).merge(params.permit(:shop_id))
  end
end
