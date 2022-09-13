class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @items = @basket.order_histories

    total_price = 0
    @items.each do |item|
    total_price += item.item.price * item.quantity
    Basket.where(id: params[:id]).update(total_price: total_price)
    end

  end

    def destroy
      @basket = Basket.find(params[:id])
      @basket.destroy
      redirect_to items_path, notice: 'Basket was successfully destroyed.', status: :see_other
    end


end
