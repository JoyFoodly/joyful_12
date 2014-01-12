class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :name, null: false, default: ''

      t.timestamps null: false
    end
  end
end
