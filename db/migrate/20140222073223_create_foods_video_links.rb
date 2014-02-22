class CreateFoodsVideoLinks < ActiveRecord::Migration
  def change
    create_table :foods_video_links, id: false do |t|
      t.belongs_to :food,       null: false
      t.belongs_to :video_link, null: false
    end

    add_index :foods_video_links, [:food_id, :video_link_id]
  end
end
