# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding..."

Category.destroy_all
Product.destroy_all

parapente = Category.create!(name: 'parapente')

Product.create!(sku: '0001', name: "Baptème de l'air", price: 75, description: "D’une durée de 15 à 20 minutes, ce vol vous permettra de découvrir les sensations d’un vol en parapente et les paysages de la Chartreuse.", category: parapente)
Product.create!(sku: '0002', name: "Vol de durée", price: 110, description: "Le vol dure environ 35 à 40 minutes et vous amènera survoler un à deux grands sommets de la Chartreuse. Une façon unique de découvrir la nature ! Vous serez encore en l’air longtemps après ce vol !", category: parapente)

puts "Seeding OK !"
