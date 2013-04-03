class AddSiteDuration < ActiveRecord::Migration
  def change
	add_column :sites, :duration, :integer, :default =>0
  end
end
