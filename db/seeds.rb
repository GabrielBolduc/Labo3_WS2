require 'faker'
Faker::Config.locale = 'fr-CA'

(1..10).each do |i|
    Business.create(name: Faker::Restaurant.name, 
                    description: Faker::Restaurant.description, 
                    phone: Faker::PhoneNumber.phone_number, 
                    email: Faker::Internet.email, 
                    site_web: Faker::Internet.url, 
                    menus_attributes: [ # Menu principal (parent)
                        {
                            title: "Fin de semaine",
                            sub_menus_attributes: [ # <-- MODIFIÉ ICI
                                {   
                                    title: "Dejeuner", 
                                    items_attributes: [
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description}
                                                ]
                                },
                                {   title: "Diner", 
                                    items_attributes: [
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description},
                                                {name: Faker::Food.vegetables, price: Faker::Commerce.price, description: Faker::Food.description}
                                                ]
                                },
                                {   title: "Souper", 
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