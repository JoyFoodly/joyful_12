class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount,     null: false, default: 0
      t.string :card_token,  null: false, default: ''
      t.string :product_id,  null: false, default: ''
      t.string :customer_id, null: false, default: ''
      t.string :charge_id,   null: false, default: ''
      t.belongs_to :user,    null: false, index: true

      t.timestamps           null: false
    end
  end
end
