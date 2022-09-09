class Item < ApplicationRecord
  has_many :shops
  has_many :order_histories
  has_many :baskets, through: :order_histories

  CATEGORIES = ['baby-toddler-kids', 'bakery', 'chilled-food', 'drinks', 'food-cupboard', 'fresh-food', 'frozen-food'].sort

  BRANDS = {}

  BRANDS["Morrisons"] = "morrisons_blzsz4"
  BRANDS["Tesco"] = "tesco_w6rgal"
  BRANDS["Poundland"] = "poundland_qppk9u"
  BRANDS["Sainsbury's"] = "sainsbury_s_en8ssv"
  BRANDS["Aldi"] = "aldi_xcjrv8"
  BRANDS["Asda"] = "asda_v6kw5g"
  BRANDS["Co-op"] = "co-op_wjaopn"

end
