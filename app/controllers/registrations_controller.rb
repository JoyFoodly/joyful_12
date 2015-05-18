class RegistrationsController < Devise::RegistrationsController
  layout 'qubico', except: [:new]

  def new
    @user = User.new
    render layout: 'sign_up_flow'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to charges_path
    else
      render :new
    end
  end

  private

  def user_params
    params[:user].permit(:first_name, :last_name, :email, :password,
                         :password_confirmation)
  end
end
