class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
	  t.text     "content"
	  t.integer  "count",      :default => 0
      t.datetime "created_at",                    :null => false
      t.datetime "updated_at",                    :null => false
      t.text     "url"
      t.integer  "duration",   :default => 0
      t.timestamps
    end
  end
end
