class CustomerController < ApplicationController
  # Creates a new customer
  def create
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  	# Create a new customer in the database
  	@customer = Customer.new

  	# Populate using form data 
  	@customer.first_name = params[:first_name]
  	@customer.last_name = params[:last_name]
  	@customer.address = params[:address]
  	@customer.phone = params[:phone]
  	@customer.mobile = params[:mobile]
  	@customer.email = params[:email]
  	@customer.notes = params[:notes]
  	@customer.deleted = false

  	# Persist and render view
  	@customer.save

    # Render index view
    # Add a flash message for the user
    flash[:message] = "#{@customer.first_name} #{@customer.last_name} was successfully created"
    redirect_to url_for(:controller => :customer, :action => :index) and return

  end

  def edit_view
  	# Find the customer who needs to be edited
  	@customer = Customer.find_by(id: params[:id])
  	# Render view
  end

  # Can be used to edit an existing customer 
  def edit
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  	# Find the customer who needs to be edited
  	@customer = Customer.find_by(id: params[:id])

  	if(@customer)
  		# Update the customer information using new information
  		# which was submitted
  		@customer.first_name = params[:first_name]
  		@customer.last_name = params[:last_name]
  		@customer.address = params[:address]
  		@customer.phone = params[:phone]
  		@customer.mobile = params[:mobile]
  		@customer.email = params[:email]
  		@customer.notes = params[:notes]
  		@customer.deleted = false

  		# Persist
  		@customer.save
  	end
  	# Render view

    # Render index view
    # Add a flash message for the user
    flash[:message] = "#{@customer.first_name} #{@customer.last_name} was successfully edited"
    redirect_to url_for(:controller => :customer, :action => :index) and return

  end

  def index
    # Ensure the user is logged in
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    @customers = Customer.where(deleted: false)
    # Otherwise the user is logged in,
    # so its cool to render
  end

  def delete
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  	# Find the customer who needs to be deleted
  	@customer = Customer.find_by(id: params[:id])

  	if(@customer)
  		@customer.deleted = true
  	end

  	# Persist
  	@customer.save
  	# Render index view
    # Add a flash message for the user
    flash[:message] = "#{@customer.first_name} #{@customer.last_name} was successfully deleted"
    redirect_to url_for(:controller => :customer, :action => :index) and return

  end


  def view
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  end
end
