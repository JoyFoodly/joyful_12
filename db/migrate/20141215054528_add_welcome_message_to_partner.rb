class AddWelcomeMessageToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :welcome_message, :text
  end
end
