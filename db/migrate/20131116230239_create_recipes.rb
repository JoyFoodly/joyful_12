class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title,        null: false, default: ''
      t.string :subtitle,     null: false, default: ''
      t.string :prep_time,    null: false, default: ''
      t.string :cook_time,    null: false, default: ''
      t.string :serving_size, null: false, default: ''
      t.string :difficulty,   null: false, default: ''
      t.text :instructions,   null: false, default: ''
      t.integer :sort_order,  null: false, default: 0
      t.references :food,     null: false, index: true

      t.timestamps null: false
    end
  end
end
