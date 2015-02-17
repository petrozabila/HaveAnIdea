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


	has_secure_password

	has_many :ideas, dependent: :destroy

	validates_presence_of :name, :email, presence: true
	validates :name, length: { maximum: 30 }
	validates :email, uniqueness: true     #= validates_uniqueness_of :email
	validates :password_digest, presence: true


def gravatar_url
	    downcased_email = email.strip.downcase
	    hash = Digest::MD5.hexdigest(downcased_email)
	    "http://gravatar.com/avatar/#{hash}"
    end







end
