class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
    @user.family_members.build if @user.family_members.blank?
  end

  def change_password
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = I18n.t('user.updated') unless params[:user][:hide_notice].present?
      flash[:warning] = I18n.t('user.email_confirmation_sent') if @user.email != user_params[:email]
      redirect_to @user.onboarded? ? page_path('orientation') : edit_user_path(@user, onboarded: false)
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation,
                                 :family_description, :family_struggles, :onboarded, family_member_params)
  end

  def family_member_params
    { family_members_attributes: [:id, :first_name, :last_name, :birthday, :other_allergies, :_destroy, allergy_ids: []] }
  end

end
