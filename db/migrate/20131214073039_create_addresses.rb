class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.references :user, index: true

      t.timestamps
    end
  end
end
