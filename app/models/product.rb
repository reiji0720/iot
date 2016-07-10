class Product < ActiveRecord::Base
  has_attached_file :itemphoto,
                      styles:  { medium: "700x700#", thumb: "280x280#" },default_url: 'noimage.png'
  validates_attachment_content_type :itemphoto,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  has_many :comments               #commentsテーブルとのアソシエーション
  belongs_to :category
  has_many :products_tags
  has_many :tags, through: :products_tags

 # タグ機能の実装
  acts_as_taggable_on :iots # post.iot_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

is_impressionable   #PV数取得

  def review_average
    self.comments.average(:rate)
  end

end
