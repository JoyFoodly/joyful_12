class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :card_token, null: false, default: ''
      t.string :plan_id,    null: false, default: ''
      t.references :user,   null: false, index: true

      t.timestamps null: false
    end
  end
end
