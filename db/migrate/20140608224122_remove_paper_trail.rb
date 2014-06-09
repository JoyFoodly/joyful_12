class RemovePaperTrail < ActiveRecord::Migration
  def up
    drop_table :versions
  end

  def down
    remove_table :versions do |t|
      t.string   :item_type, null: false, default: ''
      t.integer  :item_id,   null: false, default: 0
      t.string   :event,     null: false, default: ''
      t.string   :whodunnit
      t.text     :object
      t.text     :object_changes
      t.datetime :created_at, null: false
    end
    add_index :versions, [:item_type, :item_id]
  end
end
