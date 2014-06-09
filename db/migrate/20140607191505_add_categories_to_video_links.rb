class AddCategoriesToVideoLinks < ActiveRecord::Migration
  def change
    add_column :video_links, :category, :string
  end
end
