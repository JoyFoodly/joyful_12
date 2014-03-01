class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :user_name
      t.string :response_type
      t.string :browser_type
      t.text :message
      t.string :course_useful
      t.string :course_useful_explanation
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.string :photo_fingerprint
      t.datetime :photo_updated_at

      t.timestamps null: false
    end
  end
end
