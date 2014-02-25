class CreateDietaryCategories < ActiveRecord::Migration
  def change
    create_table :dietary_categories do |t|
      t.string :name,              null: false, default: ''
      t.string :icon_file_name,    null: false
      t.string :icon_content_type, null: false
      t.integer :icon_file_size,   null: false
      t.string :icon_fingerprint,  null: false
      t.datetime :icon_updated_at, null: false

      t.timestamps                 null: false
    end
  end
end
