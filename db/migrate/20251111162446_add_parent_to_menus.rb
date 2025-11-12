# Gabriel Bolduc 8 novembre

class AddParentToMenus < ActiveRecord::Migration[7.0]
  def change
    # Ajoute la colonne parent_id à la table :menus
    # null: true -> Permet aux menus "racine" de ne pas avoir de parent
    # foreign_key: { to_table: :menus } -> Spécifie que la clé pointe vers la table :menus elle-même
    add_reference :menus, :parent, null: true, foreign_key: { to_table: :menus }
  end
end