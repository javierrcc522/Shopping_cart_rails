class OrderItemsController < ApplicationController

  def create
    @order = current_order
    if @order.order_items.exists?(:product_id => item_params[:product_id])
      order_item = @order.order_items.where(:product_id =>
      item_params[:product_id]).first
        current_quantity = order_item.quantity
        quantity_to_add = item_params[:quantity].to_i
        order_item.quantity = current_quantity + quantity_to_add
        order_item.save!
    else
      @item = @order.order_items.new(item_params)
    end
    if @order.save
      session[:order_id] = @order.id
        flash[:notice] = "Product has been added to your order."
      redirect_to cart_path
    else
      flash[:notice] = "Please add items"
      redirect_to cart_path
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    if @order.save
      session[:order_id] = @order.id
        flash[:notice] = "Product has been removed from your order."
      @total = current_order.total_price
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js { render 'carts/destroy' }
      end
    else
      flash[:notice] = "There were some errors"
      # redirect_to cart_path
      respond_to do |format|
        format.html { redirect_to cart_path }
        format.js { render 'carts/destroy' }
      end
    end
  end

  def update
    @order = current_order
    @item = OrderItem.find(params[:id])
    @item.update(:quantity => params[:button])
    @item.save
    @order.save
    # redirect_to cart_path
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :user_id)
  end
end
