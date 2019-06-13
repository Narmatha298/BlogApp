class Article < ActiveRecord::Base

	validates :title, presence:true, length: {minimum: 1, maximum: 25}
	validates :description, presence:true, length: {minimum:1}
	belongs_to :user
	validates :user_id, presence: true
	has_many :comments, as: :commentable
	has_many :likes, dependent: :destroy
	#acts_as_commontable

end
