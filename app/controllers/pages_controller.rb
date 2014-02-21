class PagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @page = Page.find_by!(slug: params[:id])
  end

end
