# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Idea < ActiveRecord::Base

	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_presence_of :name, :description, presence: true

end
