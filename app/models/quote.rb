class Quote < ActiveRecord::Base
  belongs_to :author
	has_and_belongs_to_many :tags
	validates_presence_of :text
end
