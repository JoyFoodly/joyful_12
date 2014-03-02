class AddNameAndTypeToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :name, :text
    add_column :addresses, :type, :text
  end
end
