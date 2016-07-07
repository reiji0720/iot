class AddAttachmentItemphotoToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :itemphoto
    end
  end

  def self.down
    remove_attachment :products, :itemphoto
  end
end
