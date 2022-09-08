class OrderHistoriesController < ApplicationController

  def create
    OrderHistory.create(order_history_params)
    @basket = Basket.find(params[:basket_id])

    redirect_to basket_path(@basket)
  end

  private

  def order_history_params
    params.permit(:basket_id, :item_id)
  end
end
