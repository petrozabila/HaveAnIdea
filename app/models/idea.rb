class Idea < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name, :description, presence: true

end
