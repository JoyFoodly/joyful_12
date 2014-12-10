class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email_domain

      t.timestamps
    end
  end
end
