class Tag < ActiveRecord::Base
  has_many :products, through: :taggings
end
