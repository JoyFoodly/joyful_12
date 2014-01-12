class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1,   null: false, default: ''
      t.string :zip_code, null: false, default: ''
      t.string :city,     null: false, default: ''
      t.string :state,    null: false, default: ''
      t.string :country,  null: false, default: ''
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
