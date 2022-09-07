class ItemsController < ApplicationController
  require 'nokogiri'
  require "open-uri"

  def index
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])



    @link_name = @item.name.gsub(" ", "-").downcase

    @url = "https://www.trolley.co.uk/product/#{@link_name}/#{@item.link}"

    @html_file = URI.open(@url).read
    @html_doc = Nokogiri::HTML(@html_file)
    @search_results = @html_doc.search(".comparison-table ._item")
    @search_results.each do |search_result|
      @shop_name = search_result.search("title").text.strip
      @shop_price_string = search_result.search("._price").text.strip
      @shop_price = @shop_price_string[1..-1].to_f
      Shop.create!(item_id: @item.id, name: @shop_name, price: @shop_price)
    end



  end
end
