class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  def current_order
    
    if session[:order_id]
      Order.find(session[:order_id])
    else
      if current_user
        if Order.where(:user_id => current_user.id, :status => 'active').any?
          is_active = Order.where(:user_id => current_user.id, :status => 'active')
          Order.find(is_active.first.id)
        else
          Order.new(:user_id => current_user.id, :status => 'active')
        end
      else
        Order.new(:status => 'active')
      end
    end
  end

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password])
  end
end
