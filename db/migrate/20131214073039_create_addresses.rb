class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1,   null: false, default: ''
      t.string :zip_code, null: false, default: ''
      t.string :city,     null: false, default: ''
      t.string :state,    null: false, default: ''
      t.string :country,  null: false, default: ''
      t.references :user, index: true

      t.timestamps
    end
  end
end
