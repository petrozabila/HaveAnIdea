# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

	has_many :friendships, dependent: :destroy
	has_many :friends, :through => :friendships, dependent: :destroy

	has_many :comments
	
	has_secure_password

	has_many :ideas, dependent: :destroy

	validates :name, length: { maximum: 30 }
	validates :email, uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :password_digest, presence: true

	mount_uploader :image, ImageUploader
end
