class OrderHistoriesController < ApplicationController

  def create
    OrderHistory.create(order_history_params)
    @basket = Basket.find(params[:basket_id])

   if  current_page('items','index')
     current_page
   else
    redirect_to basket_path(@basket)
   end
  end

  private

  def order_history_params
    params.permit(:basket_id, :item_id)
  end
end
