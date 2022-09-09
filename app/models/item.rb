class Item < ApplicationRecord
  has_many :shops
  has_many :order_histories
  has_many :baskets, through: :order_histories

  CATEGORIES = ['baby-toddler-kids', 'bakery', 'chilled-food', 'drinks', 'food-cupboard', 'fresh-food', 'frozen-food'].sort

  BRANDS = {}

  BRANDS["Morrisons"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/morrisons_blzsz4.png"
  BRANDS["Tesco"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/tesco_w6rgal.png"
  BRANDS["Poundland"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/poundland_qppk9u.png"
  BRANDS["Sainsbury's"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/sainsbury_s_en8ssv.png"
  BRANDS["Aldi"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/aldi_xcjrv8.png"
  BRANDS["Asda"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662653128/asda_v6kw5g.png"
  BRANDS["Co-op"] = "https://res.cloudinary.com/dzhyyuft3/image/upload/v1662655318/co-op_wjaopn.png"

end
