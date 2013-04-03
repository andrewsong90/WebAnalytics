class AddElemnts < ActiveRecord::Migration
  def change
	add_column :sites, :enter_time, :integer
	add_column :sites, :leave_time, :integer
  end
end
