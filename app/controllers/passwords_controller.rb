class PasswordsController < Devise::PasswordsController

private

  def after_resetting_password_path_for(resource_or_scope)
    if resource.class.to_s == 'User'
      edit_user_path('me')
    else
      after_sign_in_path_for(resource_or_scope)
    end
  end

end
