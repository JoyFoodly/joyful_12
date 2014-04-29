class PagesController < ApplicationController
  before_filter :authenticate_user! unless :comments_crawler

  def show
    @page = Page.find_by!(slug: params[:id])
  end
  
private

 def comments_crawler
   request.remote_ip =~ Regexp.new(ENV['COMMENTS_CRAWLER_IP_ADDRESS'])
 end

end
