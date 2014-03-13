class AddSortOrderToVideoLinks < ActiveRecord::Migration
  def change
    add_column :video_links, :sort_order, :integer
  end
end
