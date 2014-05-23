class ParentResourcesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_onboarding

  def show
    @video_links = VideoLink.all
  end

end
