class AddUserToBusinesses < ActiveRecord::Migration[8.0]
  def change
    # 'add_reference' est la façon moderne de créer une colonne
    # qui contiendra l'ID d'un autre modèle (User).
    # 'foreign_key: true' ajoute une contrainte pour garantir
    # l'intégrité des données.
    add_reference :businesses, :user, foreign_key: true
  end
end