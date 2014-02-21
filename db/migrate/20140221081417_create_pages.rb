class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug, null: false, default: ''
      t.text :body,   null: false, default: ''

      t.timestamps null: false
    end
    add_index :pages, :slug, unique: true
  end
end
