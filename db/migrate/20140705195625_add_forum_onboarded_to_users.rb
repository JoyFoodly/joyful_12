class AddForumOnboardedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forum_onboarded, :boolean, default: false, null: false
  end
end
