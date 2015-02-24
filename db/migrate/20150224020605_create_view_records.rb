class CreateViewRecords < ActiveRecord::Migration
  def change
    create_table :view_records do |t|
      t.string :page_title
      t.string :page_info

      t.timestamps
    end
  end
end
