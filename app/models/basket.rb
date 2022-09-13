class Basket < ApplicationRecord
  belongs_to :user
  has_many :order_histories, dependent: :destroy
  has_many :items, through: :order_histories
end
