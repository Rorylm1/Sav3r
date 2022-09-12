class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @items = @basket.order_histories


  end

    # def destroy
    #   @item = Item.find(params[:id])
    #   @item.destroy
    #   redirect_to items_path, notice: 'Post was successfully destroyed.', status: :see_other
    # end
end
