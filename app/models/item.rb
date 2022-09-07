class Item < ApplicationRecord
  has_many :shops

  CATEGORIES = ['baby-toddler-kids', 'bakery', 'chilled-food', 'drinks', 'food-cupboard', 'fresh-food', 'frozen-food'].sort
end
