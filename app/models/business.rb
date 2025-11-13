# Gabriel Bolduc 8 novembre

class Business < ApplicationRecord
    has_many :menus
    accepts_nested_attributes_for :menus

    # --- AJOUT ---
    # Indique qu'une entreprise appartient à un utilisateur.
    # 'optional: true' est souvent utile, mais dans notre cas,
    # nous voudrons qu'une entreprise ait toujours un propriétaire.
    # On pourrait le laisser sans 'optional' pour le rendre obligatoire.
    belongs_to :user
    # --- FIN DE L'AJOUT ---
end