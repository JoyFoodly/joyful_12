class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.belongs_to :giver, class_name: 'User', index: true
      t.belongs_to :receiver, class_name: 'User', index: true
      t.references :coupon, index: true
      t.string :your_name
      t.string :your_email
      t.string :message
      t.string :their_email
      t.float :price

      t.timestamps
    end
  end
end
