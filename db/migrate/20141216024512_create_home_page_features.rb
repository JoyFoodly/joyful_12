class CreateHomePageFeatures < ActiveRecord::Migration
  def change
    create_table :home_page_features do |t|
      t.string :key
      t.text :content

      t.timestamps
    end
  end
end
