class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :products
         has_many :comments               #commentsテーブルとのアソシエーション

         has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" },default_url: 'noimage.jpg'
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]


end
