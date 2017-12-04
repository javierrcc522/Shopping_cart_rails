class ChargesController < ApplicationController
  before_action :amount_to_be_charged, :set_description


  def new
  end

  def create
    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: 'Rails Stripe customer')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end



  private
    def amount_to_be_charged
      @amount = 6000
    end

    def set_description
      @description = "Some amazing product"
    end
end
