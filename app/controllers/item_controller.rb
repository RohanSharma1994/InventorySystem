class ItemController < ApplicationController
  def create
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  	# Create a new Item object 
  	@item = Item.new

  	# Populate it based on form input
  	@item.name = params[:name]
  	@item.description = params[:description]
  	@item.quantity = params[:quantity]
  	@item.item_number_one = params[:item_number_1]
  	@item.item_number_two = params[:item_number_2]
  	@item.price = params[:price]
  	@item.retail_price = params[:retail_price]
  	@item.notes = params[:notes]
    @item.deleted = false
  	uploaded_io = params[:pic]
  	uuid = SecureRandom.uuid
  	@item.photo_path = uuid + uploaded_io.original_filename
	  File.open(Rails.root.join('public', 'uploads', uuid+uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @item.save
    # Add a flash message for the user
    flash[:message] = "#{@item.name} was successfully created"
    redirect_to url_for(:controller => :item, :action => :index) and return
  end

  def edit
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    # Find the item to edit
    @item = Item.find_by(id: params[:id], deleted: false)

    # Edit if neccessary
    # Populate it based on form input
    @item.name = params[:name]
    @item.description = params[:description]
    @item.quantity = params[:quantity]
    @item.item_number_one = params[:item_number_1]
    @item.item_number_two = params[:item_number_2]
    @item.price = params[:price]
    @item.retail_price = params[:retail_price]
    @item.notes = params[:notes]
    @item.save
        # Add a flash message for the user
    flash[:message] = "#{@item.name} was successfully updated"
    redirect_to url_for(:controller => :item, :action => :index) and return
  end

  def delete
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    # Find the item to delete
    @item = Item.find_by(id: params[:id])
    if(@item)
      @item.deleted = true
      @item.save
    end
    # Add a flash message for the user
    flash[:message] = "#{@item.name} was successfully deleted"
    redirect_to url_for(:controller => :item, :action => :index) and return
  end

  def index 
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    # Get all the items which haven't been deleted
    @items = Item.where(deleted: false)
    # Render view
  end

  def edit_view
    # Locate the item within the database
    @item = Item.find_by(params[:id])

    # Render
  end
end
