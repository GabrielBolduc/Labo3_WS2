class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # --- AJOUT ---
  # Un utilisateur peut posséder plusieurs entreprises.
  # Si un utilisateur est supprimé, toutes ses entreprises
  # seront également supprimées (dependent: :destroy).
  has_many :businesses, dependent: :destroy
  # --- FIN DE L'AJOUT ---
end