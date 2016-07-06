class Comment < ActiveRecord::Base
  belongs_to :product               #tweetsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
