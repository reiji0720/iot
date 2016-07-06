class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
    def new
    end

    def create
      Product.create(title: "",ex: "", image: "",category: "", price: "",detail: "",company: "",scene: "",url: "")
    end
end
