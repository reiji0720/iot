class ProductsTag < ActiveRecord::Base
  belongs_to :product
  belongs_to :tag


end
