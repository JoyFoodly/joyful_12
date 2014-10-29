class AddPublishedToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :published, :boolean
  end
end
