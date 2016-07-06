class CommentsController < ApplicationController
  def create
     @comment = Comment.create(review: comment_params[:review],rate: comment_params[:rate], product_id: comment_params[:product_id], user_id: current_user.id)
    redirect_to "/products/#{@comment.product.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end
  private
  def comment_params
    params.permit(:review, :rate, :product_id)
  end
end
