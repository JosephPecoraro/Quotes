require 'active_record/fixtures'

class LoadQuoteData < ActiveRecord::Migration

  def self.up
		down
		directory = File.join(File.dirname(__FILE__), "data")
		Fixtures.create_fixtures(directory, "tags")
		Fixtures.create_fixtures(directory, "authors")
		Fixtures.create_fixtures(directory, "quotes")
  end

  def self.down
		Tag.delete_all
		Quote.delete_all
		Author.delete_all
  end

end
