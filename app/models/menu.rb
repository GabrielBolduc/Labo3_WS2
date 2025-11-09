class Menu < ApplicationRecord
    belongs_to :business, optional: true
    has_many :menus
    has_many :items

    accepts_nested_attributes_for :items, :menus
end
