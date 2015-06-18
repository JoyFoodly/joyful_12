class RegistrationsController < Devise::RegistrationsController
  layout 'qubico', except: [:new]
  before_action :set_price

  def new
    @user = User.new
    render layout: 'sign_up_flow'
  end
  
  def create
    @user = User.new(user_params)
    coupon = found_coupon?
    @user.coupon_id = coupon.try(:id)
    @user.signed_up = true if @price == 0

    if @user.save
      coupon.destroy if coupon.try(:gift?)
      flash[:notice] = 'Your account was created successfully.'
      sign_in(User, @user)
      respond_with @user, location: after_sign_up_path_for(@user)
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
