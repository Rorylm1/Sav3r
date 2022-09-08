class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  require 'nokogiri'
  require "open-uri"

  def index
    if params[:query].present?
      @url = "https://www.trolley.co.uk/search/?from=search&q=#{params[:query]}"
      @html_file = URI.open(@url).read
      @html_doc = Nokogiri::HTML(@html_file)
      @search_results = @html_doc.search(".products-grid .product-item")
      @count = 0
      @search_results.each do |search_result|
        @search_result = search_result
        @item_name = search_result.search("._desc").text.strip
        @item_price_string = search_result.search("._price").text.strip
        @item_price =  @item_price_string[1..-1].to_f
        @item_brand =  search_result.search("._brand").text.strip
        @item_volume = search_result.search("._size").text.strip
        @item_image_link = search_result.search("._img img")
        @item_img = @item_image_link[0].to_s
        @item_product_id = @item_img.match(/\w*\d/)
        @item_img_url = "https://www.trolley.co.uk/img/product/#{@item_product_id}"

        Item.create(
          name: @item_name,
          brand: @item_brand,
          volume: @item_volume,
          price: ('%.2f' % @item_price),
          image: @item_img_url,
          link: @item_product_id.to_s
        )

        @count += 1
      end
      @items = Item.last(@count)

    else

      @items = Item.all

    end



  end







































  def show
    # if current_user.baskets.last && current_user.baskets.last.completed == false
    #   @basket = current_user.baskets.last
    # end
    # else
    #   @basket = Basket.new
    #   @basket.user = current_user
    #   @basket.completed = false
    #   @basket.save

    # end
    @item = Item.find(params[:id])

    @item.shops.destroy_all

    @link_name = @item.name.gsub(" ", "-").gsub("&", "-").downcase


    @url = "https://www.trolley.co.uk/product/#{@link_name}/#{@item.link}"

    @html_file = URI.open(@url).read
    @html_doc = Nokogiri::HTML(@html_file)
    @search_results = @html_doc.search(".comparison-table ._item")
    @search_results.each do |search_result|
      @shop_name = search_result.search("title").text.strip
      @shop_price_string = search_result.search("._price").text.strip
      @shop_price = @shop_price_string[1..-1].to_f
      Shop.create!(item_id: @item.id, name: @shop_name, price: ('%.2f' % @shop_price))
    end

    @item = Item.find(params[:id])





  end
end
