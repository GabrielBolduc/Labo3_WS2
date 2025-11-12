# Gabriel Bolduc 8 novembre
class Menu < ApplicationRecord
  belongs_to :business, optional: true

  belongs_to :parent, class_name: 'Menu', optional: true
  
  has_many :menus, class_name: 'Menu', foreign_key: 'parent_id', dependent: :destroy

  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :items
  
  accepts_nested_attributes_for :menus
end