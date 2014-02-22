class ParentResourcesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @video_links = VideoLink.all
  end

end
