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

  def search
    # Ensure the user is logged in 
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    # Obtain the user's query 
    query = params[:query]
    # Find any customers that match this query 
    @customers = Customer.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ? OR phone LIKE ? OR mobile LIKE ? OR email LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")  
    # Find any items that match this query 
    @items = Item.where("description LIKE ? OR notes LIKE ? or name LIKE ?", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%")
  end
end
