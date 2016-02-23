class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # whatever,,,
  protect_from_forgery with: :exception

  def index
  	# Initialize the users session
  	if(not session.has_key?("logged_in"))
  		session['logged_in'] = 0
  	end
  end

  def help
  end

  def contact
  end
end
