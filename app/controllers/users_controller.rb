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
      redirect_to edit_user_path(@user), notice: 'Account updated!'
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation,
                                 :family_description, :family_struggles, family_member_params)
  end

  def family_member_params
    { family_members_attributes: [:id, :first_name, :last_name, :birthday, :other_allergies, :_destroy, allergy_ids: []] }
  end

end
