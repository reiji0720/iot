class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.string      :name
        t.text        :title
        t.text        :ex
        t.integer     :category
        t.text        :image
        t.text        :price
        t.text        :scene
        t.text        :detail
        t.text        :company
        t.integer     :average

        t.timestamps
    end
  end
end
