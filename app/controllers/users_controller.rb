class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
      @nickname = user.nickname
      @products = user.products.page(params[:page]).per(5).order("created_at DESC")
 @comments = user.comments.page(params[:page]).per(5).order("created_at DESC")
    end

  def update
      user = User.find(params[:id])
        user.update(user_params)
    end

  private
  def user_params
      params.permit(:avatar,:nickname)
    end
end
