class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer "site_id"
      t.integer "duration", :default=>0
      t.integer "visit_counts", :default=>0
      t.text "URL"
      t.timestamps
    end
    remove_column :visits, :site_id
    add_column :visits, :page_id, :integer
  end
end
