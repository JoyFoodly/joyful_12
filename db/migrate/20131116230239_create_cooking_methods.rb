class CreateCookingMethods < ActiveRecord::Migration
  def change
    create_table :cooking_methods do |t|
      t.string :name
      t.text :instructions
      t.belongs_to :food, index: true

      t.timestamps
    end
  end
end
