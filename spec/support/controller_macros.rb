module ControllerMacros
  def login_user
    devise_login(:user)
  end

  def login_unpaid_user
    devise_login(:unpaid_user)
  end

  def devise_login(factory_type)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(factory_type)
      sign_in @user
    end
  end
end
