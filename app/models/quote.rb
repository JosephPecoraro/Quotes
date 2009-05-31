class Quote < ActiveRecord::Base
  belongs_to :author
	has_and_belongs_to_many :tags
	validates_presence_of :text, :author_id
	validates_associated :tags
	after_update :save_tags
	after_destroy :check_author

	def tag_attributes=(tag_attributes)
		p tag_attributes
		tag_attributes.each do |attributes|
			unless attributes[:name].blank?
				if attributes[:id].blank?
					tags.build(attributes)
				else
					tag = tags.detect { |t| t.id == attributes[:id].to_i } 
					tag.attributes = attributes
				end
			end
		end
	end
	
	def author_attributes=(author_attributes)
		unless author_attributes[:name].blank?
			self.author = Author.find_or_create_by_name( author_attributes[:name] )
		end
	end
	
private
	
	def save_tags
		should_save = false
		tags.each do |t|
			if t.should_remove?
				tags.delete(t)
				should_save = true
				t.destroy if Tag.find(t).quotes.empty?
			else
				t.save(false)
			end
		end
		save if should_save
	end
	
	def check_author
		a = Author.find(self.author)
		a.destroy if a.quotes.empty?
	end
	
end
