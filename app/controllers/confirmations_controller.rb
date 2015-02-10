class ConfirmationsController < Devise::ConfirmationsController

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_flashing_format?
      if resource.respond_to?(:coupons) && !(resource.coupons.empty?)
        tag = resource.coupons[0].shareable_tag
        if tag == 'lusutton'
          resource.save
          redirect_to foods_path
        end
      else
        raw, enc = Devise.token_generator.generate(resource.class, :reset_password_token)
        resource.reset_password_token = enc
        resource.reset_password_sent_at = Time.now.utc
        resource.save(validate: false)
        respond_with_navigational(resource){ redirect_to edit_user_password_path(reset_password_token: raw) }
      end
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
    end
  end

end
