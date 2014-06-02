class PagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @page = Page.find_by!(slug: params[:id])

    redirect_to edit_user_path(current_user) and return if !current_user.onboarded? && @page.slug != 'ToS'
  end

end
