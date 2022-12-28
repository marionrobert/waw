class CookiesController < ApplicationController
  skip_before_action :authenticate_user!


  def index
    session[:cookies_accepted] = params[:cookies_accepted] if params[:cookies_accepted]
  end
end
