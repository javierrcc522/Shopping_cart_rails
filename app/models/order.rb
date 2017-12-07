class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user, optional: true

  before_save :update_total

  scope :sort, -> {
    order(product_id: :desc)
  }



  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  # def associate_user
  #   self.user_id =
  # end


  private

  # def update_status
  #   if self.status == nil?
  #     self.status = "In progress"
  #   end
  # end

  def update_total
    self.total_price = calculate_total
  end
end
