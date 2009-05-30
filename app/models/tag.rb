class Tag < ActiveRecord::Base
	has_and_belongs_to_many :quotes
	validates_presence_of :name
end
