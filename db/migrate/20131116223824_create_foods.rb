class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false, default: ''
      t.string :slug, null: false, default: ''

      t.timestamps    null: false
    end
    add_index :foods, :slug, unique: true
  end
end
