class Basket < ApplicationRecord
  belongs_to :user
  has_many :order_histories
  has_many :items, through: :order_histories
end
