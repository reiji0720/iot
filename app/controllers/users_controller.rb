class UsersController < ApplicationController
  def show
      @nickname = current_user.nickname
      @products = current_user.products.page(params[:page]).per(5).order("created_at DESC")
    end
end
