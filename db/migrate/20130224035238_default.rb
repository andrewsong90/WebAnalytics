class Default < ActiveRecord::Migration
  def change
	change_column :sites, :visit_counts, :integer, :default=>0
  end
end
