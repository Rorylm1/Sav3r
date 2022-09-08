class Item < ApplicationRecord
  has_many :shops
  has_many :order_histories
  has_many :baskets, through: :order_histories

  CATEGORIES = ['baby-toddler-kids', 'bakery', 'chilled-food', 'drinks', 'food-cupboard', 'fresh-food', 'frozen-food'].sort
end
