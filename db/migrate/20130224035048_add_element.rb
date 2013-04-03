class AddElement < ActiveRecord::Migration
  def change
	add_column :sites, :url, :text
	add_column :sites, :visit_counts, :integer
  end
end
