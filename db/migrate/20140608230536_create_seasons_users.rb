class CreateSeasonsUsers < ActiveRecord::Migration
  def change
    create_table :seasons_users, id: false do |t|
      t.belongs_to :user,   null: false
      t.belongs_to :season, null: false
    end

    add_index :seasons_users, [:user_id, :season_id]
  end
end
