class CreateVideoLinks < ActiveRecord::Migration
  def change
    create_table :video_links do |t|
      t.string :name,          null: false, default: ''
      t.integer :height,       null: false, default: 0
      t.integer :width,        null: false, default: 0
      t.string :provider_id,   null: false, default: ''

      t.timestamps             null: false
    end
  end
end
