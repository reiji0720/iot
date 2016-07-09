class ProductsTagsController < ApplicationController
  def create
      @products_tags = ProductsTag.create(product_id: product_params[:product_id],tag_id: product_params[:tag_id])
    #redirect_to "/products/#{@products_tags.product_id}"   #コメントと結びつくツイートの詳細画面に遷移する

  end
  private
    def product_params
      params.permit(:tag_id,:product_id)
    end
end
