class VideosController < ApplicationController

  def show
    @prep_video_links = VideoLink.where(category: 'prep')
    @technique_video_links = VideoLink.where(category: 'technique')
    @kid_video_links = VideoLink.where(category: 'kid')
  end

end
