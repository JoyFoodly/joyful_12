class CustomConfirmationMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

  def confirmation_instructions(record, token, opts={})
    if record.respond_to?(:coupon_id) && !record.coupon_id.nil? && Dir.exists?("#{Rails.root}/app/views/users/mailer/#{Coupon.find(record.coupon_id).shareable_tag}")
      opts[:template_path]="users/mailer/#{Coupon.find(record.coupon_id).shareable_tag}"
    end
    super
  end
end
