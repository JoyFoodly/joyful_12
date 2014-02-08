class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name, null: false, default: ''
      t.timestamps    null: false
    end
  end
end
