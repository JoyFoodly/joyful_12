class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :sort_order,       null: false, default: 0
      t.string :file_file_name,    null: false
      t.string :file_content_type, null: false
      t.integer :file_file_size,   null: false
      t.string :file_fingerprint,  null: false
      t.datetime :file_updated_at, null: false
      t.belongs_to :imageable, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
