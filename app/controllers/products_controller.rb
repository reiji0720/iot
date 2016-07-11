class ProductsController < ApplicationController
#before_action :move_to_index, except: :index

impressionist actions: [:show]
    def index
      @products = Product.includes(:user).order("updated_at DESC").page(params[:page]).per(9)
    #@tag = Product.new
    #@productall = @products.tags
    end


    def new
      @product = Product.new #form_for用！
    end

    def create
     #
#Product.create(title: product_params[:title],iot_list: product_params[:iot_list])
      Product.create(title: product_params[:title],ex: product_params[:ex],category_id: product_params[:category_id],price: product_params[:price],pricemonth: product_params[:pricemonth],detail: product_params[:detail],company: product_params[:company],iot_list: product_params[:iot_list],scene: product_params[:scene],url: product_params[:url],itemphoto: product_params[:itemphoto],user_id: current_user.id)
    end

    def destroy
      product = Product.find(params[:id])
      if product.user_id == current_user.id
        product.destroy
      end
    end

    def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user).order("created_at DESC")
    #@tags = @product.tags
    @productpv = Product.find(params[:id])#PV数取得
  impressionist(@productpv, nil, :unique => [:session_hash])#PV数取得
  @page_views = @productpv.impressionist_count#PV数取得
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%")
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
      params.require(:product).permit(:title, :ex, :category_id, :price,:iot_list, :pricemonth, :detail, :company, :scene, :url, :itemphoto)
    end

    def up_product_params
      params.require(:product).permit(:title, :ex, :category_id,:iot_list, :price, :pricemonth, :detail, :company, :scene, :url, :itemphoto)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
