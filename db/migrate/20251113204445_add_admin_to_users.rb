class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def change
    # Ajoute la colonne 'admin' de type booléen (vrai/faux)
    # 'default: false' signifie que tous les nouveaux utilisateurs 
    # seront des utilisateurs réguliers par défaut.
    add_column :users, :admin, :boolean, default: false
  end
end