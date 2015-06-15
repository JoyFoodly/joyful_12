class AddDeletedAtToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :deleted_at, :datetime
    add_index :coupons, :deleted_at
  end
end
