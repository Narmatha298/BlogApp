class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, uniqueness: {case_sensitive: false}
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
	has_many :articles, dependent: :destroy
	before_save { self.email = email.downcase }
	has_secure_password
	#acts_as_commontator
	#attr_accessor :gallery_id, :name, :image
  	#belongs_to :gallery
	mount_uploader :image, ImageUploader
	has_many :likes, dependent: :destroy
end
