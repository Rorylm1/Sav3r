class Item < ApplicationRecord
  has_many :shops
  has_many :order_histories
  has_many :baskets, through: :order_histories

  CATEGORIES = ['baby-toddler-kids', 'bakery', 'beauty-cosmetics', 'chilled-food', 'drinks', 'food-cupboard',
                'pets', 'household', 'home-garden', 'health-toiletries', 'fresh-food', 'frozen-food'].sort

  BRANDS = {}

  BRANDS["Morrisons"] = "v1662653128/morrisons_blzsz4"
  BRANDS["Tesco"] = "v1662653128/tesco_w6rgal"
  BRANDS["Poundland"] = "v1662653128/poundland_qppk9u"
  BRANDS["Sainsbury's"] = "v1662653128/sainsbury_s_en8ssv"
  BRANDS["Aldi"] = "v1662653128/aldi_xcjrv8"
  BRANDS["Asda"] = "v1662653128/asda_v6kw5g"
  BRANDS["Co-op"] = "v1662653128/co-op_wjaopn"

end
