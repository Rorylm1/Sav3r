class OrderHistoriesController < ApplicationController

  def create
    order = OrderHistory.create(order_history_params)
    @basket = Basket.find(params[:basket_id])
  end



  def destroy
    @order_history = OrderHistory.find(params[:id])
    @order_history.destroy
    @basket = Basket.find(params[:id])
    @items = @basket.order_histories

    redirect_to basket_path, notice: 'Item was successfully removed', status: :see_other

  end

  def update
    if params[:change].present?
      @order_history = OrderHistory.find(params[:id])
      if params[:change] == 'minus'
      @order_history.quantity = @order_history.quantity - 1
      @order_history.save
      elsif params[:change] == 'add'
      @order_history.quantity = @order_history.quantity + 1
      @order_history.save
      end
      @basket = Basket.find(@order_history.basket_id)
      redirect_to basket_path(@basket)

    else

    @order_history = OrderHistory.find(params[:id])
    @order_history.update(order_history_params)
    @basket = Basket.find(@order_history.basket_id)
      redirect_to basket_path(@basket)
    end
  end


  private

  def order_history_params
    params.permit(:basket_id, :item_id, :quantity)
  end
end
