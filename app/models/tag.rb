class Tag < ActiveRecord::Base
	has_and_belongs_to_many :quotes
	validates_presence_of :name
	attr_accessor :should_remove
	
	def should_remove?
		should_remove.to_i == 1
	end
end
