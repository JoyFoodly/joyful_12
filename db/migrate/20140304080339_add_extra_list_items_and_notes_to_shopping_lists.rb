class AddExtraListItemsAndNotesToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :extra_list_items, :text
    add_column :shopping_lists, :notes, :text
  end
end
