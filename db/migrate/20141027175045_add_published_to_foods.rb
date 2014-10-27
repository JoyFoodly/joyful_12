class AddPublishedToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :published, :boolean
  end
end
