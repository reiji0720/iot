class AddPricemonthToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pricemonth, :integer
  end
end
