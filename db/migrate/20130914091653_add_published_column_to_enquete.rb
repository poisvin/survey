class AddPublishedColumnToEnquete < ActiveRecord::Migration
  def change
  	add_column :enquetes, :published, :boolean, :default => true
  end
end
