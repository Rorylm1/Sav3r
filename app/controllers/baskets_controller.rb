class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @items = @basket.order_histories

    # @items.each do |item|
    #   if item.present? # && item.name === item.name
    #     item.price += item.price
    #    end


  end
end
