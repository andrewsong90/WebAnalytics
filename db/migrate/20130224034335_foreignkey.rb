class Foreignkey < ActiveRecord::Migration
  def change
	add_column :visits, :site_id, :integer
  end
end
