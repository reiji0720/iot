class ProductsController < ApplicationController
  before_action :move_to_index, except: :index

    def index
      @products = Product.includes(:user).order("created_at DESC").page(params[:page]).per(2)
    end
    def new
    end

    def create
      Product.create(title: product_params[:title],image: product_params[:image],ex: product_params[:ex],category: product_params[:category],price: product_params[:price],detail: product_params[:detail],company: product_params[:company],scene: product_params[:scene],url: product_params[:url],user_id: current_user.id)
    end

    def destroy
      product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.destroy
      end
    end

     def edit
      @product = Product.find(params[:id])
    end

    def update
      product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.update(product_params)
      end
    end

    private
    def product_params
      params.permit(:title, :image, :ex, :category, :price, :detail, :company, :scene, :url)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
