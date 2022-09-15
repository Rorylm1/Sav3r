class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_basket

  def check_basket
    @basket ||= Basket.find_by(id: session[:basket_id])

      if @basket.nil?
        @basket = Basket.new
        @basket.completed = false
        @basket.save
        session[:basket_id] = @basket.id
      end
      @item = Item.last
  end

  def after_sign_in_path_for(resource)
    "/items"
  end

  def after_sign_up_path_for(resource)
    "/items"
  end

end

# def check_basket
#   if current_user.present?
#     if @basket.nil?
#       @basket = Basket.new
#       @basket.user = current_user
#       @basket.completed = false
#       @basket.save
#       session[:basket_id] = @basket.id
#     end
#     @basket ||= Basket.find_by(id: session[:basket_id])
#   end
# end
