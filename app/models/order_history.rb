class OrderHistory < ApplicationRecord
  has_many :baskets
  has_many :items
end
