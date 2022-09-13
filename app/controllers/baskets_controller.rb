class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @items = @basket.order_histories

  end

    def destroy
      @basket = Basket.find(params[:id])
      @basket.destroy
      redirect_to items_path, notice: 'Basket was successfully destroyed.', status: :see_other
    end
end
