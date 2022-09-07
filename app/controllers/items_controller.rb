class ItemsController < ApplicationController
  require 'nokogiri'
  require "open-uri"

  def index
    @items = Item.all

  end
end
