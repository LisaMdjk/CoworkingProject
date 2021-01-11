class HomeController < ApplicationController
  skip_before_action :authenticate_request!

  def index
  end

  def fprofile
  end
  
end
