class PagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding

  def show
    @page = Page.find_by!(slug: params[:id])
  end

end
