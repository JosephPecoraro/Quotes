class QuoteTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :quotes_tags, :id => false do |t|
      t.references :quote
			t.references :tag
    end
  end

  def self.down
    drop_table :quotes_tags
  end
end
