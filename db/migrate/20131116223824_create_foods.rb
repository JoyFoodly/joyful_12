class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :foods, :slug
  end
end
