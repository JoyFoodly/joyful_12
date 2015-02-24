class AddUserIdToViewRecord < ActiveRecord::Migration
  def change
    add_column :view_records, :user_id, :integer
  end
end
