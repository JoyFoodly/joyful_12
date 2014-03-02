class CreateWaitLists < ActiveRecord::Migration
  def change
    create_table :wait_lists do |t|
      t.string :first_name,  null: false, default: ''
      t.string :last_name,   null: false, default: ''
      t.string :email,       null: false, default: ''
      t.boolean :newsletter, null: false, default: true

      t.timestamps           null: false
    end
  end
end
