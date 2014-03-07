class AddApprovedForMarketingToForms < ActiveRecord::Migration
  def change
    add_column :forms, :approved_for_marketing, :boolean
  end
end
