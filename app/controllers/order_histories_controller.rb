class OrderHistoriesController < ApplicationController

  def create
    order = OrderHistory.create(order_history_params)
    @basket = Basket.find(params[:basket_id])
  end



  def destroy
    @order_history = OrderHistory.find(params[:id])
    @order_history.destroy
    redirect_to basket_path, notice: 'Item was successfully removed', status: :see_other

  end

  def update
    @order_history = OrderHistory.find(params[:id])
    @order_history.update(order_history_params)
    redirect_to basket_path
  end


  private

  def order_history_params
    params.permit(:basket_id, :item_id, :quantity)
  end
end
