class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @products = @tag.products
    end
    def create
      @tag = Tag.all
      end
end
