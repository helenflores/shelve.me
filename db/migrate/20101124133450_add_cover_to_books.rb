class AddCoverToBooks < ActiveRecord::Migration
  def self.up
	change_table :books do |t|
	t.string cover_file_name
	t.string cover_content_type
	t.integer cover_file_size
	t.datetime cover_update_at
  end

  def self.down
	drop_table :books
  end
end
