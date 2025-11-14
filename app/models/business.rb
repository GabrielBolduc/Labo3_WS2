# Gabriel Bolduc 8 novembre

class Business < ApplicationRecord
    has_many :menus
    accepts_nested_attributes_for :menus

    belongs_to :user
end