# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Product.destroy_all

puts "creation users"

  user_one = User.create!( email: "aurelien@gmail.com", password:"123456", admin: true)
  user_two = User.create!(   email: "jonathan@gmail.com",   password:"123456", admin: true )
  user_three = User.create!( email: "marion@gmail.com", password:"123456", admin: true)
  user_four = User.create!( email: "kevin@gmail.com", password:"123456", admin: true)

puts "utilisateurs créés"

puts "creation des produits"

produit_one = Product.create!( name: "article-1",
sku: "stripe-veut-un-sku",
description: "revolutionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
price_cents: 1000
 )

produit_two = Product.create!(
                              name: "article-2",
                              sku: "stripe-veut-un-sku",
                              description: "revolutionaire !!",
                              images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
                              price_cents: 2000
                              )


produit_three = Product.create!(
                              name: "article-3",
                              sku: "stripe-veut-un-sku",
                              description: "revolutionaire !!",
                              images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
                              price_cents: 3000
                              )

produit_four = Product.create!(
                              name: "article-4",
                              sku: "stripe-veut-un-sku",
                              description: "revolutionaire !!",
                              images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
                              price_cents: 1000
                              )

produit_five = Product.create!(
                              name: "article-5",
                              sku: "stripe-veut-un-sku",
                              description: "revoultionaire !!",
                              images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
                              price_cents: 4000
                              )

puts "produits créés"
