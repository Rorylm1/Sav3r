class Item < ApplicationRecord
  has_many :shops

  CATEGORIES = ['bakery', 'chilled-food', 'drinks', 'food-cupboard', 'fresh-food', 'frozen-food'].sort
end
