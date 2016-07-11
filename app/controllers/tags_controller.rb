class TagsController < ApplicationController
  def index
    @items = Product.tagged_with(params[:tag])
    end

  def show
    @tag = Tag.find(params[:id])
    @products = @tag.products
    end
    def create
      @tag = Tag.all
      end
end
