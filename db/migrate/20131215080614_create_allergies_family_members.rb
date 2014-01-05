class CreateAllergiesFamilyMembers < ActiveRecord::Migration
  def change
    create_table :allergies_family_members, id: false do |t|
      t.references :allergy
      t.references :family_member
    end
    add_index :allergies_family_members, [:allergy_id, :family_member_id], name: 'index_allergies_family_members_allergy_id_and_family_member_id'
  end
end
