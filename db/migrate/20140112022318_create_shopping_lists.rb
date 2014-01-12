class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.datetime :completed_at
      t.belongs_to :user,       null: false, index: true

      t.timestamps              null: false
    end
  end
end
