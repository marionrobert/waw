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

  user_one = User.create!( email: "aurelien@gmail.fr", password:"123456" )
  user_two = User.create!(   email: "jo@gmail.fr",   password:"123456" )

 puts "creation produits"

produit_one = Product.create!( name: "article-1",
description: "revolutionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
 )

produit_two = Product.create!( name: "article-2",
description: "revolutionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
 )


produit_three = Product.create!( name: "article-3",
description: "revolutionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
 )

produit_four = Product.create!( name: "article-4",
description: "revolutionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
 )

produit_five = Product.create!( name: "article-5",
description: "revoultionaire !!",
images: "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
 )
