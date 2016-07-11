class TagsController < ApplicationController
  def index
    @tag = Tag.all
    end

  def show
    @tag = Tag.find(params[:id])
    @products = @tag.products
    end
    def create
      @tag = Tag.all
      end
end
