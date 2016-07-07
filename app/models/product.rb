class Product < ActiveRecord::Base
  has_attached_file :itemphoto,
                      styles:  { medium: "700x700#", thumb: "280x280#" },default_url: 'images/default.jpg'
  validates_attachment_content_type :itemphoto,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

  belongs_to :user
  has_many :comments               #commentsテーブルとのアソシエーション

  def review_average
    self.comments.average(:rate)
  end
end
