class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @items = @basket.items

  end
end
