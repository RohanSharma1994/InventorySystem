class UserController < ApplicationController
	def create
		if (session[:logged_in] != 1)
		   redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
	    end
		# Ensure the user doesn't already exist
		@user = User.find_by(email: params[:email], deleted: false)
		if (@user)
			flash[:message] = "#{params[:email]} already exists in the database."
		    redirect_to url_for(:controller => :user, :action => :index) and return
		end
		# Otherwise populate the user as usual
		# Populate user based on form input 
		@user = User.new
		@user.email = params[:email]
		@user.password = params[:password]
		@user.deleted = false
		# Notes reserved for future use

		# Persist
		@user.save
		flash[:message] = "#{params[:email]} was registered successfully."

		# Render
		redirect_to url_for(:controller => :user, :action => :index) and return
	end

	def edit 
		if (session[:logged_in] != 1)
		   redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
	    end
		@user = User.find_by(id: params[:id], deleted: false)

		# It exists
		if(@user)
			flash[:message] = "#{@user.email} was successfully updated."
			# Populate user based on form input 
			@user.password = params[:password]
			# Persist
			@user.save
		end
		# Render
		redirect_to url_for(:controller => :user, :action => :index) and return

	end

	def edit_view
		# Find the user to edit
		@user = User.find_by(params[:id])
		# Render by populating fields
	end

	def delete
		if (session[:logged_in] != 1)
		   redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
	    end
		# Find the user to delete

		x = User.find_by(id: params[:id])
		if(x)
			x.deleted = true
			x.save
		end
		flash[:message] = "#{x.email} was successfully deleted."

		# Render
		redirect_to url_for(:controller => :user, :action => :index) and return
	end

	def log_out
		# Awaiting session module
		session['logged_in'] = 0
		redirect_to url_for(:controller => :application, :action => :index) and return
	end

	def log_in
	    # Get the parameters passed in
	    email = params[:email]
	    password = params[:password]

	    # Find the user trying to log in
	    user = User.find_by(email: email, deleted: false)

	    if (user)
	    	# Check if this user has the correct password
	    	if(user.password == password and user.deleted == false)
	    		session['logged_in'] = 1
	    		session['user_id'] = user.id
	    	else
	    		redirect_to url_for(:controller => :user, :action => :index_incorrect) and return
			end
	   	else 
	   		redirect_to url_for(:controller => :user, :action => :index_incorrect) and return
		end
			redirect_to url_for(:controller => :application, :action => :index) and return

	end

	def index 
		if (session['logged_in'] != 1) 
      		redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    	end
    	@users = User.where(deleted: false)
	end

	def index_incorrect
	end

	def index_not_logged_in
	end
end
