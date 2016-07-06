class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :rate
      t.text :text
      t.text :review
      t.timestamps
    end
  end
end
