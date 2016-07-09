class Tag < ActiveRecord::Base
  has_many :products_tags
  has_many :products, through: :products_tags
end
