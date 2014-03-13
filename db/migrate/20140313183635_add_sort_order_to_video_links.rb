class AddSortOrderToVideoLinks < ActiveRecord::Migration
  def change
    add_column :video_links, :sort_order, :integer, null: false, default: 0
  end
end
