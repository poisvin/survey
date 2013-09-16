class AddPublishedColumnToEnquete < ActiveRecord::Migration
  def change
  	add_column :enquetes, :published, :boolean, :default => 1
  end
end
