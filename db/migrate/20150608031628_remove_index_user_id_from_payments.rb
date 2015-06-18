class RemoveIndexUserIdFromPayments < ActiveRecord::Migration
  def change
    remove_index(:payments, column: :user_id)
  end
end
