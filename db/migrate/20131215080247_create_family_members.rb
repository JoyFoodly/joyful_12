class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :other_allergies
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
