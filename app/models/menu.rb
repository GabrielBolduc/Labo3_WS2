# Gabriel Bolduc 8 novembre

class Menu < ApplicationRecord
  # Un menu peut appartenir à une entreprise (s'il est à la racine)
  belongs_to :business, optional: true

  # Associations pour la structure arborescente (parent/enfant)
  belongs_to :parent, class_name: 'Menu', optional: true
  has_many :sub_menus, class_name: 'Menu', foreign_key: 'parent_id', dependent: :destroy

  # Un menu a plusieurs items
  has_many :items, dependent: :destroy

  # Accepter les attributs imbriqués pour les items ET les sous-menus
  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :sub_menus # <-- Doit correspondre au 'has_many :sub_menus'
end