class HomeController < ApplicationController
  def index
    user=User.find_by_id(current_user.id)
    session[:current_user] = user
  end
end
