class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    @order_item = OrderItem.new
  end
end
