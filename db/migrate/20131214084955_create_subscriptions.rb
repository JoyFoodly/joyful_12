class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :card_token, null: false, default: ''
      t.string :plan_id,    null: false, default: ''
      t.references :user, index: true

      t.timestamps
    end
  end
end
