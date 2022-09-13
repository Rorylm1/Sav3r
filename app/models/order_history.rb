class OrderHistory < ApplicationRecord
  belongs_to :basket
  belongs_to :item

  validates :quantity, presence: true
end
