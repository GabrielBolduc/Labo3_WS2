require 'faker'
Faker::Config.locale = 'fr-CA'

# --- 1. Nettoyage ---
puts "Nettoyage de la base de données..."
Item.destroy_all
Menu.destroy_all
Business.destroy_all
User.destroy_all

# --- 2. Création des Utilisateurs ---
puts "Création des utilisateurs..."

# 1. Utilisateur Administrateur
admin_user = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
  user.admin = true # Définit cet utilisateur comme admin
end
puts "Utilisateur admin créé: #{admin_user.email}"

# 2. Utilisateur Régulier
regular_user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
  # user.admin reste 'false' par défaut
end
puts "Utilisateur régulier créé: #{regular_user.email}"


# --- 3. Création des 10 Entreprises avec leurs propriétaires ---
puts "Création de 10 restaurants..."

(1..10).each do |i|
    
    # Assigne les 5 premiers à l'admin, les 5 suivants à l'utilisateur régulier
    owner = if i <= 5
              admin_user
            else
              regular_user
            end

    puts "Création du restaurant ##{i} pour #{owner.email}..."
    
    Business.create(
      # AJOUT: Lier l'entreprise à son propriétaire
      user: owner, 
      
      # Votre code existant
      name: Faker::Restaurant.name, 
      description: Faker::Restaurant.description, 
      phone: Faker::PhoneNumber.phone_number, 
      email: Faker::Internet.email, 
      site_web: Faker::Internet.url, 
      menus_attributes: [
        {
          title: "Fin de semaine",
          menus_attributes: [
            {   
              title: "Dejeuner", 
              items_attributes: [
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description}
              ]
            },
            {   
              title: "Diner", 
              items_attributes: [
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description}
              ]
            },
            {   
              title: "Souper", 
              items_attributes: [
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description}
              ]
            }
          ]
        }
      ]
    )
end
