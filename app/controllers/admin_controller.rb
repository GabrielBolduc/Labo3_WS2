# Gabriel Bolduc
# Ce fichier est le parent de tous les contrôleurs de la section Admin
# Nous le mettons à jour pour sécuriser toute la section.

class AdminController < ApplicationController
  # --- AJOUTS ---

  # 1. Exige que l'utilisateur soit connecté (méthode de Devise)
  # Si non connecté, redirige vers la page de connexion.
  before_action :authenticate_user!
  
  # 2. Exige que l'utilisateur soit un admin (notre méthode ci-dessous)
  # S'exécute APRES authenticate_user!
  before_action :check_admin

  private

  # 3. Notre méthode de vérification personnalisée
  def check_admin
    # 'current_user' est fourni par Devise et représente l'utilisateur connecté.
    # '.admin?' est la méthode créée par la colonne booléenne 'admin'.
    
    # 'unless' signifie "sauf si" (if not)
    unless current_user.admin?
      # Si l'utilisateur n'est PAS admin, on le redirige vers la page
      # d'accueil (root_path) avec un message d'alerte.
      redirect_to root_path, alert: "Vous n'avez pas les droits d'accès à cette section."
    end
  end
  # --- FIN DES AJOUTS ---
end