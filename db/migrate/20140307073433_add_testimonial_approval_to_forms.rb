class AddTestimonialApprovalToForms < ActiveRecord::Migration
  def change
    add_column :forms, :testimonial_approval, :boolean
  end
end
