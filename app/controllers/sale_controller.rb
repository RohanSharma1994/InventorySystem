class SaleController < ApplicationController
  def create
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    @sale = Sale.new
    @customer = Customer.find(params[:customer_id])
    @sale.customer_id = params[:customer_id]  
    @sale.transaction_type = params[:transaction_type]
    @sale.deposit_amount = params[:deposit]
    @sale.sale_status = params[:status]
    item_ids = params[:itemid]
    quantities = params[:quantity]
    amount = 0
    @sale.save
    if(item_ids) then
    item_ids.each_index do |i|
      item = Item.find(item_ids[i])
      # Decrease the item quantity
      item.quantity = item.quantity - Integer(quantities[i])
      item.save
      # Keep calculating the total amount for the sale 
      amount = amount + item.retail_price * (quantities[i].to_f)
      saleItem = SaleItem.new 
      saleItem.name = item.name
      saleItem.quantity = quantities[i].to_i
      saleItem.price_per_item = item.retail_price.to_f
      saleItem.total_price = saleItem.quantity * saleItem.price_per_item
      saleItem.item_id = item.id 
      saleItem.sale_id = @sale.id
      saleItem.save
      @sale.sale_items.push(saleItem)
    end
    @sale.amount = amount
    @sale.save
    @customer.sales.push(@sale)
    @customer.save
  end
    flash[:message] = "The sale was successfully saved"
    redirect_to url_for(:controller => :sale, :action => :index) and return
  end

  # No point editing sales, just delete it and start again
  def delete
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
  end

  def index
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    # Render to view
    # Get a list of all the customers in the db
    @customers = Customer.where(deleted: false)
    # Get a list of items in the database
    @items = Item.where(deleted: false)
    # Render the page
    @sales = Sale.all
  end 

  def view_sale
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    @sale = Sale.find(params[:id])
    # Render appropriately
  end

  def complete_sale
    if (session['logged_in'] != 1) 
      redirect_to url_for(:controller => :user, :action => :index_not_logged_in) and return
    end
    @sale = Sale.find(params[:id])
    @sale.sale_status = "Completed"
    @sale.save
    flash[:message] = "Sale with reference: #{@sale.id} was successfully completed."
    redirect_to url_for(:controller => :sale, :action => :index) and return

  end

end
