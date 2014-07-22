class PagesController < ApplicationController

  def show
    @page = Page.find_by!(slug: params[:id])

    unless @page.slug.in? %w[gift gift-sent]
      authenticate_user!
      redirect_to edit_user_path(current_user) and return if !current_user.onboarded? && @page.slug != 'ToS'
    end
  end

end
