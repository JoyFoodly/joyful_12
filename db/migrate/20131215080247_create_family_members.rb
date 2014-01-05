class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :other_allergies
      t.references :user

      t.timestamps
    end
  end
end
