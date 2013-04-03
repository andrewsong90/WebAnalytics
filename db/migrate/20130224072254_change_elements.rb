gclass ChangeElements < ActiveRecord::Migration
  def change
	remove_column :sites, :enter_time
	remove_column :sites, :leave_time
	add_column :visits, :enter_time, :integer
	add_column :visits, :leave_time, :integer
  end
end
