require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "fwitter_secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    slim :home
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
