class CustomConfirmationMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

  def confirmation_instructions(record, token, opts={})
    if record.respond_to?(:coupon_id) && !record.coupon_id.nil? && Dir.exists?("#{Rails.root}/app/views/devise/mailer/#{record.coupon_id}")
      opts[:template_path]="devise/mailer/#{record.coupon_id}"
    end
    super
  end
end
