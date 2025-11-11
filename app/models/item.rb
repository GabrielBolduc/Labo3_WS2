class Item < ApplicationRecord
  belongs_to :menu

  validates :name, presence: true
  validates :price, numericality: true, allow_nil: true
end
