class AddTipsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :tips, :text
  end
end
