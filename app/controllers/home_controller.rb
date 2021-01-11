class HomeController < ApplicationController
  skip_before_action :authenticate_request!

  def index
  end

  def fprofile
  end

  # For reconfirm request after receive reminder email every 3 months
  #def reconfirm(request)
    #puts "RECONFIRM ACTION?"
    #request.confirmed_at = Date.current
    #request.expired = false
    #request.reminder = false
  #end
end
