class CommentsController < ApplicationController
  def create
     @comment = Comment.create(review: comment_params[:review],rate: comment_params[:rate], product_id: comment_params[:product_id], user_id: current_user.id)
    redirect_to "/products/#{@comment.product.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  def destroy
      comment = Comment.find(params[:id])
      if comment.user_id == current_user.id
        comment.destroy
      end
    end

   def edit
      @comment = Comment.find(params[:id])
    end

    def update
      comment = Comment.find(params[:id])
      if comment.user_id == current_user.id
        comment.update(comment_params)
      end
    end

  private
  def comment_params
    params.permit(:review, :rate, :product_id)
  end
end
