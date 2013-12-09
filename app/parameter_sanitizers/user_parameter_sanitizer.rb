class UserParameterSanitizer < Devise::ParameterSanitizer

  def sign_in
    default_params.permit(:email, :password)
  end

  def sign_up
    default_params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :zip_code)
  end

end
