class HomeController < ApplicationController

  def index
    expires_in 1.minute, public: true
  end

end
