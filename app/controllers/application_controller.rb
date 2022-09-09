class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_basket

  def check_basket

    @basket ||= Basket.find_by(id: session[:basket_id])

    if @basket.nil?
      @basket = Basket.new
      @basket.user = current_user
      @basket.completed = false
      @basket.save
Item::BRA
      session[:basket_id] = @basket.id
    end
  end
end
