require 'faker'
Faker::Config.locale = 'fr-CA'

Item.destroy_all
Menu.destroy_all
Business.destroy_all
User.destroy_all

# 1. Utilisateur Administrateur
admin_user = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "qwerty"
  user.password_confirmation = "qwerty"
  user.admin = true
end

# 2. Utilisateur Régulier
regular_user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "qwerty"
  user.password_confirmation = "qwerty"
end


(1..10).each do |i|
    
    # 5 premier a admin, 5 autres au user
    owner = if i <= 5
              admin_user
            else
              regular_user
            end
    
    Business.create(
      user: owner, 
      
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
