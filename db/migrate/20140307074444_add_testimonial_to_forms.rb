class AddTestimonialToForms < ActiveRecord::Migration
  def change
    add_column :forms, :testimonial, :boolean
  end
end
