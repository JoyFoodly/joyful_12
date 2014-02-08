class AddSeasonToFoodsAndUsers < ActiveRecord::Migration
  def change
    add_reference :foods, :season, index: true
    add_reference :users, :season, index: true
  end
end
