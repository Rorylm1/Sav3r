class Basket < ApplicationRecord
  belongs_to :user
  belongs_to :order_history
  has_many :items, through: :order_history
end
