require "open-uri"

Shop.destroy_all
puts "Boutique supprimée"
User.destroy_all
puts "Tous les utilisateurs sont supprimés"
Category.destroy_all
puts "Toutes les catégories sont supprimées"
Subcategory.destroy_all
puts "Les sous-catégories aussi - même si un dependent destroy existe"
Product.destroy_all
puts " et enfin destockage on vide les rayons de tous les produits malgré un dependent destroy"
Favorite.destroy_all
puts "on détruit les favoris enregistrés pour chaque utilisateur"
Blogpost.destroy_all
puts "on détruit tous les articles de blog"

puts "création de 4 utilisateurs format prenom@gmail.com et  mot de passe = 123456"
user_one = User.create!(email: "aurelien@gmail.com", password: "123456", admin: true)
user_two = User.create!(email: "jeannoel@gmail.com", password: "123456", admin: false)
user_three = User.create!(email: "marion@gmail.com", password: "123456", admin: false)
user_four = User.create!(email: "kevin@gmail.com", password: "123456", admin: false)
puts "#{User.count} utilisateurs créés"
puts "1 profil administrateur créé(aurelien), 3 non admins créés"

puts "La société est liquidée"
Shop.create!(user: User.where(admin: true).first, name: "Wall Art Works", description: "Transformez votre espace", phone: "06.80.77.57.22", siren: "123456789",
address: "4 rue Albert Einstein, 93200 Saint Denis", card: "card6", themebgcolor: "white", themefont: "'Montserrat', sans-serif ", bannerpub: "Livraison offerte dès 129€",
 juridicform: "EI", capitalisation: 1000, localregister: "Saint Denis", email: "contact@monsite.fr", uetva: "FR76123456789", president: "PREVOST Aurélien")

 puts "#{Shop.count} Le Nouveau magasin ouvre ses portes"
 Coupon.destroy_all


blogpost_1 = Blogpost.create!(title:"Quel vin choisir avec quel plat ?",
                              content:"There are many variations of passages of Lorem Ipsum available, but the majority have
                                      suffered alteration in some form, by injected humour, or randomised words which don't look
                                      even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be
                                      sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum
                                      generators on the Internet tend to repeat predefined chunks as necessary, making this the
                                      first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined
                                      with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.
                                      The generated Lorem Ipsum is therefore always free from repetition, injected humour, or
                                      non-characteristic words etc.")
                              file1 = URI.open("https://french-wine-thailand.com/wp-content/uploads/2021/09/All-about-red-wine.jpg")
                              blogpost_1.photos.attach(io: file1, filename: "blogpost_1_photo.png")

blogpost_2 = Blogpost.create!(title:"Quand reviser son vehicule ?",
                              content:"There are many variations of passages of Lorem Ipsum available, but the majority have
                                      suffered alteration in some form, by injected humour, or randomised words which don't look
                                      even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be
                                      sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum
                                      generators on the Internet tend to repeat predefined chunks as necessary, making this the
                                      first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined
                                      with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.
                                      The generated Lorem Ipsum is therefore always free from repetition, injected humour, or
                                      non-characteristic words etc.")
                              file1 = URI.open("https://assets.prod.roole.fr/data/assets/vidange_vignette_1fc3e66524.png")
                              blogpost_2.photos.attach(io: file1, filename: "blogpost_1_photo.png")

blogpost_3 = Blogpost.create!(title:"Où partir en 2023 ?",
                              content:"There are many variations of passages of Lorem Ipsum available, but the majority have
                                      suffered alteration in some form, by injected humour, or randomised words which don't look
                                      even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be
                                      sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum
                                      generators on the Internet tend to repeat predefined chunks as necessary, making this the
                                      first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined
                                      with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.
                                      The generated Lorem Ipsum is therefore always free from repetition, injected humour, or
                                      non-characteristic words etc.")
                              file1 = URI.open("https://media.routard.com/image/40/2/panneaux-voyage.1603402.w430.jpg")
                              blogpost_3.photos.attach(io: file1, filename: "blogpost_1_photo.png")




puts "CREATION DES DIFFERENTES CATEGORIES ET SOUS-CATEGORIES ASSOCIES"
# CATEGORIE 1

category1 = Category.create!(name:"NATURE")
            file1 = URI.open("https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
            category1.photos.attach(io: file1, filename: "category_1_photo.png")
puts "category #{category1.name} créée"

  subcategory1 = Subcategory.new(name:"Forêt")
  subcategory1.category = category1
  subcategory1.save!
  puts "Sous-catégorie #{subcategory1.name} créée"

  subcategory2 = Subcategory.new(name:"Paysage")
  subcategory2.category = category1
  subcategory2.save!
  puts "Sous-catégorie #{subcategory2.name} créée"

  subcategory3 = Subcategory.new(name:"Minimalist")
  subcategory3.category = category1
  subcategory3.save!
  puts "Sous-catégorie #{subcategory3.name} créée"

  subcategory4 = Subcategory.new(name:"Peinture à l'huile")
  subcategory4.category = category1
  subcategory4.save!
  puts "Sous-catégorie #{subcategory4.name} créée"

  subcategory5 = Subcategory.new(name:"Animaux")
  subcategory5.category = category1
  subcategory5.save!
  puts "Sous-catégorie #{subcategory5.name} créée"


# CATEGORIE 2

category2 = Category.create!(name:"ENFANT")
            file1 = URI.open("https://images.unsplash.com/photo-1541043081679-e877f6b15b51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
            category2.photos.attach(io: file1, filename: "category_2_photo.png")
puts "category #{category2.name} créée"

  subcategory6 = Subcategory.new(name:"Conte de fée")
  subcategory6.category = category2
  subcategory6.save!
  puts "Sous-catégorie #{subcategory6.name} créée"

  subcategory7 = Subcategory.new(name:"animaux 3D")
  subcategory7.category = category2
  subcategory7.save!
  puts "Sous-catégorie #{subcategory7.name} créée"

  subcategory8 = Subcategory.new(name:"dessin")
  subcategory8.category = category2
  subcategory8.save!
  puts "Sous-catégorie #{subcategory8.name} créée"

  subcategory9 = Subcategory.new(name:"animaux")
  subcategory9.category = category2
  subcategory9.save!
  puts "Sous-catégorie #{subcategory9.name} créée"

  subcategory10 = Subcategory.new(name:"coloré")
  subcategory10.category = category2
  subcategory10.save!
  puts "Sous-catégorie #{subcategory10.name} créée"

# CATEGORIE 3

category3 = Category.create!(name:"POSTER")
            file1 = URI.open("https://images.unsplash.com/photo-1578136021257-09de0a2cf45c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
            category3.photos.attach(io: file1, filename: "category_3_photo.png")
puts "category #{category3.name} créée"

  subcategory11 = Subcategory.new(name:"Pin-up")
  subcategory11.category = category3
  subcategory11.save!
  puts "Sous-catégorie #{subcategory11.name} créée"

  subcategory12 = Subcategory.new(name:"Ville")
  subcategory12.category = category3
  subcategory12.save!
  puts "Sous-catégorie #{subcategory12.name} créée"

  subcategory13 = Subcategory.new(name:"Nature")
  subcategory13.category = category3
  subcategory13.save!
  puts "Sous-catégorie #{subcategory13.name} créée"

  subcategory14 = Subcategory.new(name:"Auto/Moto")
  subcategory14.category = category3
  subcategory14.save!
  puts "Sous-catégorie #{subcategory14.name} créée"


# CATEGORIE 4

category4 = Category.create!(name:"ABSTRAIT")
            file1 = URI.open("https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
            category4.photos.attach(io: file1, filename: "category_4_photo.png")
puts "category #{category4.name} créée"

  subcategory15 = Subcategory.new(name:"Sombre")
  subcategory15.category = category4
  subcategory15.save!
  puts "Sous-catégorie #{subcategory15.name} créée"

  subcategory16 = Subcategory.new(name:"Coloré")
  subcategory16.category = category4
  subcategory16.save!
  puts "Sous-catégorie #{subcategory16.name} créée"

  subcategory17 = Subcategory.new(name:"abstrait Minimalist")
  subcategory17.category = category4
  subcategory17.save!
  puts "Sous-catégorie #{subcategory17.name} créée"

  subcategory18 = Subcategory.new(name:"Inclassable")
  subcategory18.category = category4
  subcategory18.save!
  puts "Sous-catégorie #{subcategory18.name} créée"

  subcategory18 = Subcategory.new(name:"Reference")
  subcategory18.category = category4
  subcategory18.save!
  puts "Sous-catégorie #{subcategory18.name} créée"



# CATEGORIE 5

category5 = Category.create!(name:"LIFE STYLE")
            file1 = URI.open("https://images.unsplash.com/photo-1428790067070-0ebf4418d9d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
            category5.photos.attach(io: file1, filename: "category_5_photo.png")
puts "category #{category5.name} créée"

  subcategory21 = Subcategory.new(name:"Zen")
  subcategory21.category = category5
  subcategory21.save!
  puts "Sous-catégorie #{subcategory21.name} créée"

  subcategory22 = Subcategory.new(name:"Sport")
  subcategory22.category = category5
  subcategory22.save!
  puts "Sous-catégorie #{subcategory22.name} créée"

  subcategory23 = Subcategory.new(name:"Cyberpunk/Steampunk")
  subcategory23.category = category5
  subcategory23.save!
  puts "Sous-catégorie #{subcategory23.name} créée"

  subcategory24 = Subcategory.new(name:"Comics")
  subcategory24.category = category5
  subcategory24.save!
  puts "Sous-catégorie #{subcategory24.name} créée"


# CATEGORIE 6

category6 = Category.create!(name:"ART DE LA TABLE")
            file1 = URI.open("https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80")
            category6.photos.attach(io: file1, filename: "category_6_photo.png")
puts "category #{category6.name} créée"

  subcategory27 = Subcategory.new(name:"Glace")
  subcategory27.category = category6
  subcategory27.save!
  puts "Sous-catégorie #{subcategory27.name} créée"

  subcategory28 = Subcategory.new(name:"Dessert et confiserie")
  subcategory28.category = category6
  subcategory28.save!
  puts "Sous-catégorie #{subcategory28.name} créée"

  subcategory29 = Subcategory.new(name:"Boulangerie/Patisserie")
  subcategory29.category = category6
  subcategory29.save!
  puts "Sous-catégorie #{subcategory29.name} créée"

  subcategory30 = Subcategory.new(name:"Café-thé")
  subcategory30.category = category6
  subcategory30.save!
  puts "Sous-catégorie #{subcategory30.name} créée"

  subcategory31 = Subcategory.new(name:"Plat")
  subcategory31.category = category6
  subcategory31.save!
  puts "Sous-catégorie #{subcategory31.name} créée"

  subcategory32 = Subcategory.new(name:"Divers")
  subcategory32.category = category6
  subcategory32.save!
  puts "Sous-catégorie #{subcategory32.name} créée"


# CATEGORIE 7

# category7 = Category.create!(name:"Plomberie et sanitaire")
#             file1 = URI.open("https://www.abctravaux.org/wp-content/uploads/2021/11/tout-savoir-sur-la-plomberie-sanitaire.jpg")
#             category7.photos.attach(io: file1, filename: "category_7_photo.png")
# puts "category #{category7.name} créée"

#   subcategory33 = Subcategory.new(name:"Tube et raccord")
#   subcategory33.category = category7
#   subcategory33.save!
#   puts "Sous-catégorie #{subcategory33.name} créée"

#   subcategory34 = Subcategory.new(name:"robinetterie")
#   subcategory34.category = category7
#   subcategory34.save!
#   puts "Sous-catégorie #{subcategory34.name} créée"

#   subcategory35 = Subcategory.new(name:"Wc et chasse d'eau")
#   subcategory35.category = category7
#   subcategory35.save!
#   puts "Sous-catégorie #{subcategory35.name} créée"

#   subcategory36 = Subcategory.new(name:"Evacuation")
#   subcategory36.category = category7
#   subcategory36.save!
#   puts "Sous-catégorie #{subcategory36.name} créée"

#   subcategory37 = Subcategory.new(name:"traitement de l'eau")
#   subcategory37.category = category7
#   subcategory37.save!
#   puts "Sous-catégorie #{subcategory37.name} créée"

# CATEGORIE 8

# category8 = Category.create!(name:"Luminaire")
#             file1 = URI.open("http://www.eminza.com/uploads/media/5cab35adcedcd/luminaire-blog-mea-1960x1228.jpg")
#             category8.photos.attach(io: file1, filename: "category_8_photo.png")
# puts "category #{category8.name} créée"

#   subcategory34 = Subcategory.new(name:"Ampoules")
#   subcategory34.category = category8
#   subcategory34.save!
#   puts "Sous-catégorie #{subcategory34.name} créée"

#   subcategory35 = Subcategory.new(name:"Eclairage portatif")
#   subcategory35.category = category8
#   subcategory35.save!
#   puts "Sous-catégorie #{subcategory35.name} créée"

#   subcategory36 = Subcategory.new(name:"Exterieur solaire")
#   subcategory36.category = category8
#   subcategory36.save!

#   puts "Sous-catégorie #{subcategory36.name} créée"

#   subcategory37 = Subcategory.new(name:"Eclairage d'appoint")
#   subcategory37.category = category8
#   subcategory37.save!
#   puts "Sous-catégorie #{subcategory37.name} créée"

#   subcategory38 = Subcategory.new(name:"Lustres et plafonnier")
#   subcategory38.category = category8
#   subcategory38.save!
#   puts "Sous-catégorie #{subcategory38.name} créée"



puts "#{Category.count} Categories créés avec #{Subcategory.count} Sous-categories associés en tout"




puts "Remplissage des rayons"


# ////////////////////

product_1 = Product.create!(
  name: "wolfs",
  main: true,
  sku: "wolfs_90x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "loup nature froid blanc animaux",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 7845,
  discount_ending_date: Time.zone.parse('31-05-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_1.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_2 = Product.create!(
  name: "wolfs",
  main: false,
  sku: "wolfs_90x60_paysage_Toilesurchassiscanvas100%coton340gm2",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  description: "loup nature froid blanc animaux",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_3 = Product.create!(
  name: "wolfs",
  main: false,
  sku: "wolfs_90x60_paysage_PVCexpanse5mmforex",
  description: "loup nature froid blanc animaux",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_3.photos.attach(io: file1, filename: "product_3_photo.png")
# product_3.photos.attach(io: file2, filename: "product_3_photo.png")
# product_3.photos.attach(io: file3, filename: "product_3_photo.png")

puts "Produit #{Product.last.id} créé"

# ////////////////////////////////

product_4 = Product.create!(
  name: "wolfs",
  sku: "wolfs_120x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "loup nature froid blanc animaux",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 120,
  height: 90,
  support:"Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation:"paysage",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_4.photos.attach(io: file1, filename: "product_4_photo.png")
# product_4.photos.attach(io: file2, filename: "product_4_photo.png")
# product_4.photos.attach(io: file3, filename: "product_4_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_5 = Product.create!(
  name: "wolfs",
  sku: "wolfs_120x90_paysage_Toilesurchassiscanvas100%coton340gm2",
  description: "loup nature froid blanc animaux",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 120,
  height: 90,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_5.photos.attach(io: file1, filename: "product_5_photo.png")
# product_5.photos.attach(io: file2, filename: "product_5_photo.png")
# product_5.photos.attach(io: file3, filename: "product_5_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_6 = Product.create!(
  name: "wolfs",
  sku: "wolfs_120x90_paysage_PVCexpanse5mmforex",
  description: "loup nature froid blanc animaux",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 895,
  discount_ending_date: Time.zone.parse('21-04-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 120,
  height: 90,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1673549599522-12df44624fbc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1113&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_6.photos.attach(io: file1, filename: "product_6_photo.png")
# product_6.photos.attach(io: file2, filename: "product_6_photo.png")
# product_6.photos.attach(io: file3, filename: "product_6_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_7 = Product.create!(
  name: "notfriendlywolf",
  sku: "notfriendlywolf_60x120_portrait_Toileseulecanvas100%coton340gm2",
  description: "loup agressif sombre nature animaux sauvage",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 34900,
  discount_price_cents: 22900,
  discount_ending_date: Time.zone.parse('21-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 60,
  height: 120,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: true)
file1 = URI.open("https://images.unsplash.com/photo-1590420485404-f86d22b8abf8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_7.photos.attach(io: file1, filename: "product_7_photo.png")
# product_7.photos.attach(io: file2, filename: "product_7_photo.png")
# product_7.photos.attach(io: file3, filename: "product_7_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_8 = Product.create!(
  name: "notfriendlywolf",
  sku: "notfriendlywolf_60x120_portrait_Toilesurchassiscanvas100%coton340gm2",
  description: "loup agressif sombre nature animaux sauvage",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 39900,
  discount_price_cents: 29900,
  discount_ending_date: Time.zone.parse('21-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 120,
  height: 60,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1590420485404-f86d22b8abf8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_8.photos.attach(io: file1, filename: "product_8_photo.png")
# product_8.photos.attach(io: file2, filename: "product_8_photo.png")
# product_8.photos.attach(io: file3, filename: "product_8_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_9 = Product.create!(
  name: "notfriendlywolf",
  sku: "notfriendlywolf_60x120_portrait_PVCexpanse5mmforex",
  description: "loup agressif sombre nature animaux sauvage",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 42900,
  discount_price_cents: 35900,
  discount_ending_date: Time.zone.parse('21-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 120,
  height: 60,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1590420485404-f86d22b8abf8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_9.photos.attach(io: file1, filename: "product_9_photo.png")
# product_9.photos.attach(io: file2, filename: "product_9_photo.png")
# product_9.photos.attach(io: file3, filename: "product_9_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

# ////////////////////

product_10 = Product.create!(
  name: "departure",
  main: true,
  sku: "departure_45x45_carre_Toileseulecanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 451,
  discount_ending_date: Time.zone.parse('31-04-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 45,
  height: 45,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_10.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_11 = Product.create!(
  name: "departure",
  main: false,
  sku: "departure_60x60_carre_Toilesurchassiscanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 60,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_11.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_12 = Product.create!(
  name: "departure",
  main: false,
  sku: "departure_90x90_carre_PVCexpanse5mmforex",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 90,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_12.photos.attach(io: file1, filename: "product_3_photo.png")
# product_3.photos.attach(io: file2, filename: "product_3_photo.png")
# product_3.photos.attach(io: file3, filename: "product_3_photo.png")

puts "Produit #{Product.last.id} créé"

# ////////////////////////////////

product_13 = Product.create!(
  name: "departure",
  sku: "departure_100x100_carre_Toileseulecanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 100,
  height: 100,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_13.photos.attach(io: file1, filename: "product_4_photo.png")
# product_4.photos.attach(io: file2, filename: "product_4_photo.png")
# product_4.photos.attach(io: file3, filename: "product_4_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_14 = Product.create!(
  name: "departure",
  sku: "departure_25x25_carre_Toilesurchassiscanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 4521,
  discount_ending_date: Time.zone.parse('31-06-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 25,
  height: 25,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_14.photos.attach(io: file1, filename: "product_5_photo.png")
# product_5.photos.attach(io: file2, filename: "product_5_photo.png")
# product_5.photos.attach(io: file3, filename: "product_5_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_15 = Product.create!(
  name: "departure",
  sku: "departure_100x100_carre_PVCexpanse5mmforex",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 100,
  height: 100,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_15.photos.attach(io: file1, filename: "product_6_photo.png")
# product_6.photos.attach(io: file2, filename: "product_6_photo.png")
# product_6.photos.attach(io: file3, filename: "product_6_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_16 = Product.create!(
  name: "departure",
  sku: "departure_60x60_carre_Toileseulecanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 34900,
  discount_price_cents: 22900,
  discount_ending_date: Time.zone.parse('21-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 60,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_16.photos.attach(io: file1, filename: "product_7_photo.png")
# product_7.photos.attach(io: file2, filename: "product_7_photo.png")
# product_7.photos.attach(io: file3, filename: "product_7_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_17 = Product.create!(
  name: "departure",
  sku: "departure_45x45_carre_Toilesurchassiscanvas100%coton340gm2",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 39900,
  discount_price_cents: 29900,
  discount_ending_date: Time.zone.parse('13-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 45,
  height: 45,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_17.photos.attach(io: file1, filename: "product_8_photo.png")
# product_8.photos.attach(io: file2, filename: "product_8_photo.png")
# product_8.photos.attach(io: file3, filename: "product_8_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_18 = Product.create!(
  name: "departure",
  sku: "departure_120x120_carre_PVCexpanse5mmforex",
  description: "bateau depart port spectacle",
  meta_description: "un bateau quitte le port pour voguer vers le large",
  price_cents: 42900,
  discount_price_cents: 35900,
  discount_ending_date: Time.zone.parse('30-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 120,
  height: 120,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680263202313-852e5189e823?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_18.photos.attach(io: file1, filename: "product_9_photo.png")
# product_9.photos.attach(io: file2, filename: "product_9_photo.png")
# product_9.photos.attach(io: file3, filename: "product_9_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

# ////////////////////

product_19 = Product.create!(
  name: "line",
  main: true,
  sku: "line_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "line mountain",
  meta_description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_19.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_20 = Product.create!(
  name: "line",
  main: false,
  sku: "line_60x90_portrait_Toilesurchassiscanvas100%coton340gm2",
  description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  meta_description: "line mountain",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_20.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_21 = Product.create!(
  name: "line",
  main: false,
  sku: "line_60x90_portrait_PVCexpanse5mmforex",
  description: "line mountain",
  meta_description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  price_cents: 29400,
  discount_price_cents: 5412,
  discount_ending_date: Time.zone.parse('14-06-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_21.photos.attach(io: file1, filename: "product_3_photo.png")
# product_3.photos.attach(io: file2, filename: "product_3_photo.png")
# product_3.photos.attach(io: file3, filename: "product_3_photo.png")

puts "Produit #{Product.last.id} créé"

# ////////////////////////////////

product_22 = Product.create!(
  name: "line",
  sku: "line_90x120_portrait_Toileseulecanvas100%coton340gm2",
  description: "line mountain",
  meta_description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 120,
  support:"Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation:"portrait",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_22.photos.attach(io: file1, filename: "product_4_photo.png")
# product_4.photos.attach(io: file2, filename: "product_4_photo.png")
# product_4.photos.attach(io: file3, filename: "product_4_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_23 = Product.create!(
  name: "line",
  sku: "line_90x120_portrait_Toilesurchassiscanvas100%coton340gm2",
  description: "line mountain",
  meta_description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 120,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_23.photos.attach(io: file1, filename: "product_5_photo.png")
# product_5.photos.attach(io: file2, filename: "product_5_photo.png")
# product_5.photos.attach(io: file3, filename: "product_5_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_24 = Product.create!(
  name: "line",
  sku: "line_90x120_portrait_PVCexpanse5mmforex",
  description: "line mountain",
  meta_description: "someone crossing between two mountain on a line, feeling the deep under his feets",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 120,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1680241526823-470f2b661240?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_24.photos.attach(io: file1, filename: "product_6_photo.png")
# product_6.photos.attach(io: file2, filename: "product_6_photo.png")
# product_6.photos.attach(io: file3, filename: "product_6_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_25 = Product.create!(
  name: "coquelicot",
  sku: "coquelicot_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "focus coquelicot",
  meta_description: "un coquelicot seul dans un champ ",
  price_cents: 34900,
  discount_price_cents: 22900,
  discount_ending_date: Time.zone.parse('15-05-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: true)
file1 = URI.open("https://images.unsplash.com/photo-1526818655834-d62a36fda59f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_25.photos.attach(io: file1, filename: "product_7_photo.png")
# product_7.photos.attach(io: file2, filename: "product_7_photo.png")
# product_7.photos.attach(io: file3, filename: "product_7_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_26 = Product.create!(
  name: "coquelicot",
  sku: "coquelicot_60x90_portrait_Toilesurchassiscanvas100%coton340gm2",
  description: "focus coquelicot",
  meta_description: "un coquelicot seul dans un champ ",
  price_cents: 39900,
  discount_price_cents: 29900,
  discount_ending_date: Time.zone.parse('12-06-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 60,
  height: 90,
  support: "Toilesurchassiscanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1526818655834-d62a36fda59f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_26.photos.attach(io: file1, filename: "product_8_photo.png")
# product_8.photos.attach(io: file2, filename: "product_8_photo.png")
# product_8.photos.attach(io: file3, filename: "product_8_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


product_27 = Product.create!(
  name: "coquelicot",
  sku: "coquelicot_60x90_portrait_PVCexpanse5mmforex",
  description: "focus coquelicot",
  meta_description: "un coquelicot seul dans un champ ",
  price_cents: 42900,
  discount_price_cents: 35900,
  discount_ending_date: Time.zone.parse('23-04-2023 23:59:59'),
  stock_quantity: 5,
  supplier_delay: 14,
  width: 60,
  height: 90,
  support: "PVCexpanse5mmforex",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory2,
  main: false)
file1 = URI.open("https://images.unsplash.com/photo-1526818655834-d62a36fda59f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/b941be79-ce56-4a1d-b48e-536336b6fc39.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/84841877/3d9b7f3b-fb37-40b8-ac66-2b87c85947f1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_27.photos.attach(io: file1, filename: "product_27_photo.png")
# product_9.photos.attach(io: file2, filename: "product_9_photo.png")
# product_9.photos.attach(io: file3, filename: "product_9_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_28 = Product.create!(
  name: "city_road",
  main: true,
  sku: "city_road_60x60_carre_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680673535587-05f5e3c6880d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_28.photos.attach(io: file1, filename: "product_28_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_29 = Product.create!(
  name: "enseignetokyo",
  main: true,
  sku: "enseignetokyo_50x80_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 50,
  height: 80,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680673535663-7dfe0ca784da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_29.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_30 = Product.create!(
  name: "tokyostreet",
  main: true,
  sku: "tokyostreet_60x60_care_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 7415,
  discount_ending_date: Time.zone.parse('23-05-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "carre",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680673535587-05f5e3c6880d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1926&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_30.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_31 = Product.create!(
  name: "trek",
  main: true,
  sku: "trek_45x70_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 45,
  height: 70,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680528811934-b976d0c446af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_31.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_32 = Product.create!(
  name: "nomansland",
  main: true,
  sku: "nomansland_90x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_32.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_33 = Product.create!(
  name: "sunnyplants",
  main: true,
  sku: "sunnyplants_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680413286277-34c88fc9b049?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_33.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_34 = Product.create!(
  name: "citizenact",
  main: true,
  sku: "citizenact_90x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1679678691005-3815eb29bc61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_34.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////
# # ////////////////////////////////

product_35 = Product.create!(
  name: "surforfly",
  main: true,
  sku: "surforfly_45x70_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 45,
  height: 70,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680562727022-158f17391a9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_35.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////
product_36 = Product.create!(
  name: "drunk",
  main: true,
  sku: "drunk_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680629478068-659129a4e414?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=658&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_36.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_37 = Product.create!(
  name: "surfeverywhere",
  main: true,
  sku: "surfeverywhere_45x70_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 852,
  discount_ending_date: Time.zone.parse('04-06-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 45,
  height: 70,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=665&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_37.photos.attach(io: file1, filename: "product_38_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////
# # ////////////////////////////////

product_38 = Product.create!(
  name: "surfeverywhere",
  main: false,
  sku: "surfeverywhere_80x150_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 80,
  height: 150,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=665&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_38.photos.attach(io: file1, filename: "product_38_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_39 = Product.create!(
  name: "feellittle",
  main: true,
  sku: "feellittle_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680442170372-4a30138d03f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_39.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_40 = Product.create!(
  name: "foreignstreet",
  main: true,
  sku: "foreignstreet_50x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 50,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680373369132-1feaaccbef04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_40.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_41 = Product.create!(
  name: "modernromance",
  main: true,
  sku: "modernromance_90x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680625777622-58b1e0f17afd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1256&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_41.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_42 = Product.create!(
  name: "focusoneggs",
  main: true,
  sku: "focusoneggs_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680642729809-ab7ba4b28da0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_42.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_43 = Product.create!(
  name: "droneviewforest",
  main: true,
  sku: "droneviewforest_75x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 75,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1669985168729-571894001a2e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1075&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_43.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_44 = Product.create!(
  name: "emptystadium",
  main: true,
  sku: "emptystadium_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "stade sport vide competition",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 7410,
  discount_ending_date: Time.zone.parse('31-05-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1674327175233-51f4d1430eac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_44.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_45 = Product.create!(
  name: "brightwater",
  main: true,
  sku: "brightwater_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680169276460-857463081825?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_45.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_46 = Product.create!(
  name: "homesweethome",
  main: true,
  sku: "homesweethome_80x50_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 80,
  height: 50,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1679939153966-6ec05249db1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_46.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_47 = Product.create!(
  name: "girlinfield",
  main: true,
  sku: "girlinfield_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680263547745-4e0555920ea2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_47.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_48 = Product.create!(
  name: "easyclimbing",
  main: true,
  sku: "easyclimbing_90x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 75,
  height: 50,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680584300354-a33993e1a750?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_48.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_49 = Product.create!(
  name: "youmeanselfie",
  main: true,
  sku: "youmeanselfie_45x80_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 45,
  height: 80,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680566822089-4830308972ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_49.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_50 = Product.create!(
  name: "whiteloneliness",
  main: true,
  sku: "whiteloneliness_90x50_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 50,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680675805063-3aa8b3607b0a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_50.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_51 = Product.create!(
  name: "preciousthangold",
  main: true,
  sku: "preciousthangold_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 842,
  discount_ending_date: Time.zone.parse('06-04-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680607102205-e98d20a12930?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_51.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_52 = Product.create!(
  name: "chiarobscuroreverted",
  main: true,
  sku: "chiarobscuroreverted_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 852,
  discount_ending_date: Time.zone.parse('25-04-2023 23:59:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680523004872-f38aad6922b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_52.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_53 = Product.create!(
  name: "acidulé",
  main: true,
  sku: "acidulé_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://plus.unsplash.com/premium_photo-1675237625886-7529b3b0c1cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_53.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_54 = Product.create!(
  name: "backgroundfocus",
  main: true,
  sku: "backgroundfocus_60x90_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 842,
  discount_ending_date: Time.zone.parse('07-04-2023 23:45:59'),
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680634218996-287b2985870e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_54.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"# # ////////////////////////////////

product_55 = Product.create!(
  name: "lookup",
  main: true,
  sku: "lookup_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680620296999-fd133df32ed2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_55.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_56 = Product.create!(
  name: "yellowellipse",
  main: true,
  sku: "yellowellipse_90x45_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 90,
  height: 45,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680627251286-7b8bfd3bf2e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_56.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_57 = Product.create!(
  name: "springcommings",
  main: true,
  sku: "springcomings_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680607014792-5e95088d6e2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_57.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_58 = Product.create!(
  name: "earlymorningriver",
  main: true,
  sku: "earlymorningriver_50x80_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 50,
  height: 80,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680631757284-617846a5ef29?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=702&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_58.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_59 = Product.create!(
  name: "bigcitylife",
  main: true,
  sku: "bigcitylife_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1673349586431-9f4bfbb0552d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_59.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_60 = Product.create!(
  name: "japanandtradition",
  main: true,
  sku: "japanandtradition_60x90_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 60,
  height: 90,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680529687272-9a49f34fdf4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_60.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_61 = Product.create!(
  name: "nicebuilding",
  main: true,
  sku: "nicebuilding_50x80_portrait_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 50,
  height: 80,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "portrait",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680454161096-7734f7938c5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_61.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////

product_62 = Product.create!(
  name: "vertigo",
  main: true,
  sku: "vertigo_80x60_paysage_Toileseulecanvas100%coton340gm2",
  description: "ville route",
  meta_description: "tableau d'un loup qui lutte contre le vent",
  price_cents: 29400,
  discount_price_cents: 0,
  stock_quantity: 0,
  supplier_delay: 21,
  width: 80,
  height: 60,
  support: "Toileseulecanvas100%coton340gm2",
  frame_quantity: 1,
  orientation: "paysage",
  subcategory: subcategory1
)
file1 = URI.open("https://images.unsplash.com/photo-1680262302403-a6ea3c9fb952?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1285&q=80")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1601223.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/80162918/1049372.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
product_62.photos.attach(io: file1, filename: "product_1_photo.png")
# product_1.photos.attach(io: file2, filename: "product_1_photo.png")
# product_1.photos.attach(io: file3, filename: "product_1_photo.png")

puts "Produit #{Product.last.id} créé"
# product_7 = Product.create!(
#   name: "Poêle à granulés FREEPOINT Duke airtight noir 12 kW",
#   sku: "849055721",
#   description: "Poêle à granulés de bois de dernière génération, Duke Airtight s'allume automatiquement et règle la chaleur de façon intelligente et confortable, en fonction de la température de consigne souhaitée.
#   Une technologie performante qui permet de réaliser des économies de chauffage avec le maximum de respect pour l'écosystème.",
#   price_cents: 3790,
#   discount_price_cents: 0,
#   stock_quantity: 42,
#   supplier_delay: 7,
#   subcategory: subcategory2)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/84905572/6f5be75c-d9ed-4c91-962c-f63b2edb2750.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/84905572/52d46c83-0f1a-4d28-8918-48d94b67c342.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_7.photos.attach(io: file1, filename: "product_7_photo.png")
# product_7.photos.attach(io: file2, filename: "product_7_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_8 = Product.create!(
#   name: "Poêle à granulés EXTRAFLAME canalisable Dahiana Plus VSF ivoire 10 kW",
#   sku: "843424797",
#   description: "Poêle à granulés Extraflame Dahiana canalisable permatant de chauffer plusieurs pièces. Il permet aussi de profiter d'une chauffe silencieuse grâce à la fonction ' CONFORT AIR ». Sa conception est robuste grâce au foyer, porte et brasier en fonte. L'échangeur à faisceau tubulaire garantie une performance optimale. Le bac à cendres amovible simplifie l'entretien. Avec son grand réservoir de 30kg il permet une autonomie importante. Le poêle Extraflame Dahiana offre une vision importante de la flamme grâce à sa vitre imposante pour le plaisir des yeux.
#   Poêle à granulés canalisable Extraflame DAHIANA PLUS VSF IVOIR",
#   price_cents: 549000,
#   discount_price_cents: 389000,
#   stock_quantity: 32,
#   supplier_delay: 21,
#   subcategory: subcategory2)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/84342479/3271958.png?width=650&height=650&format=jpg&quality=80&fit=bounds")

# product_8.photos.attach(io: file1, filename: "product_8_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_9 = Product.create!(
#   name: "Air Conditionné LG CT18F/CT18R",
#   sku: "89674657",
#   description: "Cassette de plafond encastré multi-split",
#   price_cents: 159000,
#   discount_price_cents: 0,
#   stock_quantity: 16,
#   supplier_delay: 14,
#   subcategory: subcategory3)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/85407537/e6b19f32a9dc9f9561a0e177c2ab1668.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_9.photos.attach(io: file1, filename: "product_9_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_10 = Product.create!(
#   name: "Ensemble de conduits d onduleur RZGD70 NANUK R32 ULTRA DC - BAXI",
#   sku: "87456899",
#   description: "Baxi Nanuk RZGD70 Ducted Air Conditioning avec le nouveau gaz réfrigérant R32. Avec pompe de vidange incluse et seulement 245 mm de haut. Sa puissance est de 6 020 Kcal en froid et de 6 880 Kcal en chaud. Classe énergétique A++/A+.",
#   price_cents: 143279,
#   discount_price_cents: 0,
#   stock_quantity: 42,
#   supplier_delay: 28,
#   subcategory: subcategory3)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/86287526/437ee142acf02e6de9abbcefaeeb808a.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/MKP/86287526/b0bcde31cb1e6ab51a37f20c98a65e42.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/MKP/86287526/30ad831591f9fbfc1e0d8dfc2f8e47bb.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_10.photos.attach(io: file1, filename: "product_10_photo.png")
# product_10.photos.attach(io: file2, filename: "product_10_photo.png")
# product_10.photos.attach(io: file3, filename: "product_10_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_11 = Product.create!(
#   name: "Climatiseur monobloc réversible KLIMEA 12hp vertical, 3100 W",
#   sku: "96874411",
#   description: "Contrairement à d'autres climatiseurs monoblocs, il n'est pas nécessaire de faire appel à un professionnel certifié afin d'installer ce produit.",
#   price_cents: 219000,
#   discount_price_cents: 0,
#   stock_quantity: 51,
#   supplier_delay: 21,
#   subcategory: subcategory3)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/82248777/987099.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/82248777/3276882.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/82248777/3268158.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_11.photos.attach(io: file1, filename: "product_11_photo.png")
# product_11.photos.attach(io: file2, filename: "product_11_photo.png")
# product_11.photos.attach(io: file3, filename: "product_11_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_12 = Product.create!(
#   name: "Climatiseur mobile WHIRLPOOL Pac c0 2800 W",
#   sku: "71228CE",
#   description: "Pièce jusqu'à 25m2 (9K BTU / 2,5KW) • Classe Froid: A / EER : 2,6 • Niveau sonore : 64db • Usages complémentaires : Ventilation, déshumidification • Minuteur 1-12h • Filtre Hepa • Gaz réfrigérant : R290 • Couleur : Blanc • Dimensions : 44,8 x 74, 4 x 40 • Equipements : télécommande, support télécommande intégré, poignées de transport, 4 roulettes, kit fenêtre. Fonctions : 6ème sens : le capteur thermique évalue automatiquement la température de la pièce. Le climatiseur identifie alors la combinaison optimale des fonctions nécessaires (chauffage, refroidissement, ventilation ou déshumidification) pour atteindre les conditions souhaitées le plus rapidement possible. Around U : Un capteur intégré dans la télécommande permet d'obtenir une température ambiante uniforme. Mode Silence : le climatiseur est capable de fonctionner très silencieusement (49db), pour un confort optimal.",
#   price_cents: 79000,
#   discount_price_cents: 54900,
#   stock_quantity: 36,
#   supplier_delay: 14,
#   subcategory: subcategory3)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/82145119/9e2fb844-b31f-4d94-b978-7d7d468f63be.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/82145119/ed327f91-d428-4032-aeee-310929a4cfb7.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/82145119/ffe75bf7-ca2c-46be-a4dc-0030fbd008aa.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file4 = URI.open("https://media.adeo.com/marketplace/LMFR/82145119/5cf28a20-1a8e-49eb-b987-48ed96b758bb.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file5 = URI.open("https://media.adeo.com/marketplace/LMFR/82145119/bd737a15-147f-4760-af9c-2ed773386b1c.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_12.photos.attach(io: file1, filename: "product_12_photo.png")
# product_12.photos.attach(io: file2, filename: "product_12_photo.png")
# product_12.photos.attach(io: file3, filename: "product_12_photo.png")
# product_12.photos.attach(io: file4, filename: "product_12_photo.png")
# product_12.photos.attach(io: file5, filename: "product_12_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_13 = Product.create!(
#   name: "Ventilateur de Plafond 122cm DC Blanc IP44 Carpe Outdoor M",
#   sku: "75415ZEDC",
#   description: "attention - description can't be blank",
#   price_cents: 19900,
#   discount_price_cents: 0,
#   stock_quantity: 9,
#   supplier_delay: 21,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/83739144/cdfe59a40090afa038fed0365e4779f5.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/MKP/83739144/b182f9630952527743c665434240aed2.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/MKP/83739144/81643a4cc56ebf43445b71cece25a2c5.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_13.photos.attach(io: file1, filename: "product_13_photo.png")
# product_13.photos.attach(io: file2, filename: "product_13_photo.png")
# product_13.photos.attach(io: file3, filename: "product_13_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_14 = Product.create!(
#   name: "Colonne d'air à poser, THOMSON, Turbo tactile noir 50 W, D1 cm",
#   sku: "CVSDE548",
#   description: "Mode turbo, télécommande, mode sommeil, programmation : 12 heures, oscillant sur angle, hauteur : 116cm, ventilation : 3 vitesses. Ventilateur tour 116cm LED avec télécommande - turbo tactile",
#   price_cents: 9900,
#   discount_price_cents: 8900,
#   stock_quantity: 78,
#   supplier_delay: 21,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/82538013/9b73ffbf-c1a9-411d-8580-2ab615e1bc27.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/82538013/b71eb774-2336-4499-84aa-593c8ce0b59d.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_14.photos.attach(io: file1, filename: "product_14_photo.png")
# product_14.photos.attach(io: file2, filename: "product_14_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_15 = Product.create!(
#   name: "POWER TOOL - Ventilateur tour oscillant à poser télécommande 75W - 3 vitesses de ventilation - Oscillation à 90° - Minuterie - NoirVoir",
#   sku: "AWDZECC48",
#   description: "Ventilateur tour oscillant à poser puissant et compact. Il est équipé de 3 programmes de ventilation et 3 vitesses de fonctionnement. Il offre le niveau sonore faible grâce à sa vitesse de rotation et sa pression d'air basse. Le ventilateur peut être contrôlé à l'aide d'une télécommande incluse. Il est doté d'une fonction de minuterie, CARACTÉRISTIQUES TECHNIQUES: Alimentation: 230V / 50Hz, Puissance: 75W, 3 vitesses de ventilation, Diamètre: 40cm / 16'', Diamètre socle: 40cm, Oscillation à 90°, Hauteur: 115cm - 135cm, Minuterie: 0,5 - 7,5h, Télécommande",
#   price_cents: 12699,
#   discount_price_cents: 7924,
#   stock_quantity: 27,
#   supplier_delay: 7,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/85226388/60abf773abb0f9f5d161c030eba7bb84.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/MKP/85226388/72409ddb504c877f0e5e2179e0dc25f3.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/MKP/85226388/95e9a7e32e19c614f918399eef333c51.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file4 = URI.open("https://media.adeo.com/marketplace/MKP/85226388/99f1248966e91bc855a2ad289a89080f.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file5 = URI.open("https://media.adeo.com/marketplace/MKP/85226388/420933ead2ad21343c52ff6bf860bbb7.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_15.photos.attach(io: file1, filename: "product_15_photo.png")
# product_15.photos.attach(io: file2, filename: "product_15_photo.png")
# product_15.photos.attach(io: file3, filename: "product_15_photo.png")
# product_15.photos.attach(io: file4, filename: "product_15_photo.png")
# product_15.photos.attach(io: file5, filename: "product_15_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_16 = Product.create!(
#   name: "BESTRON Ventilateur colonne 75cm - minuterie 120 mn - 50W - Blanc - Debit dair 26,25m3/min.- Vitesse de lair 2,65m/sec",
#   sku: "1258747",
#   description: "Ventilateur colonne 75cm | minuterie 120 mn | 50W | Blanc | Débit d'air 26,25m³/min.| Vitesse de l'air 2,65m/sec | Sonore: 55,9 dB",
#   price_cents: 3758,
#   discount_price_cents: 0,
#   stock_quantity: 58,
#   supplier_delay: 14,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/83501179/c54e817e786ec6fe6f6db291d876f13c.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/MKP/83501179/519a53492bcfa899b700957df64f05bf.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/MKP/83501179/eec1a357edfb57131f1777bb2efc7fed.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_16.photos.attach(io: file1, filename: "product_16_photo.png")
# product_16.photos.attach(io: file2, filename: "product_16_photo.png")
# product_16.photos.attach(io: file3, filename: "product_16_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_17 = Product.create!(
#   name: "Ventilateur à poser, DAEWOO, Dcool chromé 55 W, D30 cm",
#   sku: "PMOIL8",
#   description: "
#   Type de produit	A poser
#   Marque du produit	DAEWOO
#   Puissance (en W)	55
#   Nombre de vitesses	3
#   Famille de couleur	Gris / argent
#   Matière principale	Acier
#   Diamètre (en cm)	30
#   Poids du produit nu (en kg)	3.2
#   Oscillation	Oui
#   Inclinable	Oui
#   Objet connecté	Non
#   Fonction ionisation	Non
#   Télécommande	Non
#   Fixation murale possible	Non
#   Alimentation	Secteur
#   Moteur DC	Non
#   Produit emballé : hauteur (en cm)	23
#   Produit emballé : largeur (en cm)	35
#   Produit emballé : profondeur (en cm)	35
#   Produit emballé : poids (en kg)	4",
#   price_cents: 4090,
#   discount_price_cents: 3790,
#   stock_quantity: 346,
#   supplier_delay: 21,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/78621361/6d8bc2f3-9bf8-4b1b-9f44-c114a7697cc3.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_17.photos.attach(io: file1, filename: "product_17_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_18 = Product.create!(
#   name: "Ventilateur à poser, DUUX, Globe dxcf07 avec pack batterie noir 2 W, D33 cmVoir",
#   sku: "XCD41",
#   description: "Consommation électrique – 2-27w • Niveau sonore – 13-50 dBa • Circulation d'air– 198m³/hr • 90⁰ oscillation horizontale • 100⁰ oscillation verticale • 3 vitesses • Commande tactile • Indicateurs d'état LED • Moteur DC puissant • Portée du vent de 7m • Minuterie 1 et 3 heures • Comprend une télécommande
#   Grâce à son design moderne, Globe s'intègre parfaitement sur toute table, bureau ou plan de travail. Mais sa beauté n'est pas seulement superficielle. Ce ventilateur de table est doté d'un moteur CC puissant d'une portée de 7 mètres, optimisé par l'oscillation horizontale (90⁰) et verticale (80⁰). Cette nouvelle caractéristique unique permet au ventilateur d'atteindre les moindres recoins d'une pièce. Look unique Globe se caractérise par un design discret qui s'intègre parfaitement dans tout intérieur. Grâce à son look minimaliste et son panneau de commande tactile convivial, ce ventilateur saura vous séduire. Globe est disponible en blanc ou noir. Puissant et économe en énergie Globe est doté d'un puissant moteur CC, ce qui lui assure une portée impressionnante de 7 mètres. Ça doit consommer beaucoup non ? Pas du tout ! Le ventilateur de table ne consomme que 2 W à la vitesse la plus faible. Fonctionnement simple Globe possède trois réglages de vitesse manuels, pour une entière liberté de réglage de sa puissance. Son oscillation horizontale (90⁰) et verticale (80⁰) permet une circulation d'air dans toute la pièce et le mode de mise en veille automatique permet à Globe de s'arrêter même si vous dormez déjà. Gardez le contrôle Globe se commande facilement grâce à son panneau de commande tactile convivial. Ses indicateurs d'état LED sont faciles à lire et affichent le réglage exact du ventilateur. Vous voulez rester dans votre sofa ? Vous avez accès à toutes les fonctionnalités de Globe avec la télécommande incluse.",
#   price_cents: 9490,
#   discount_price_cents: 0,
#   stock_quantity: 46,
#   supplier_delay: 14,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/82538377/715307fe-4bef-4653-abe1-1fdf1539ef90.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/82538377/13678356-b8b8-4619-bb78-235bcab21d76.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file3 = URI.open("https://media.adeo.com/marketplace/LMFR/82538377/2cfe6500-790b-4944-8322-601dfcc91a54.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file4 = URI.open("https://media.adeo.com/marketplace/LMFR/82538377/4a439f74-4c28-4bb4-8894-3745be66a411.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file5 = URI.open("https://media.adeo.com/marketplace/LMFR/82538377/f88957c5-0f05-46d4-84ec-6bc8f069efab.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")

# product_18.photos.attach(io: file1, filename: "product_18_photo.png")
# product_18.photos.attach(io: file2, filename: "product_18_photo.png")
# product_18.photos.attach(io: file3, filename: "product_18_photo.png")
# product_18.photos.attach(io: file4, filename: "product_18_photo.png")
# product_18.photos.attach(io: file5, filename: "product_18_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_19 = Product.create!(
#   name: "Ventilateur Nébuliseur EDM 80W - 30cm - Blanc et noir 33515",
#   sku: "78OOOOOZ22",
#   description: "Ventilateur Nébuliseur EDM 80W - 30cm - Blanc et noir 33515, ventilateur réglable avec une télécommande afin de le régler de loins. Il offre une puissance de 80W et se déplace sur roulette.


#   Avantages :

#   Possibilité de régler sur 3 vitesses
#   Possibilité de programmer
#   Brumisateur
#   Réservoir de 1,6 litres


#   Performances :
#   Puissance : 80 W
#   Diamètre hélice : 30 cm
#   Dimensions : 80 x 27 x 47 cm
#   Réservoir d'eau : 1,6 L
#   Nombre de vitesse : 3
#   Nombre délices : 6
#   Couleur : Blanc/Noir
#   Poids : 7,8 Kg
#   Référence : 33515
#   Conditionnement :

#   1x Ventilateur Nébuliseur EDM 80W - 30cm - Blanc et noir 33515
#   Livrée dans son emballage d'origine",
#   price_cents: 15090,
#   discount_price_cents: 12990,
#   stock_quantity: 107,
#   supplier_delay: 21,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/MKP/82802516/3988fb713fab7dcd3fb7e7c73b2fe2e1.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_19.photos.attach(io: file1, filename: "product_19_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_20 = Product.create!(
#   name: "Mini ventilateur de table, EQUATION, Yea 2 noir 3 W, D11.4 cm",
#   sku: "801254",
#   description: "can't be blank",
#   price_cents: 700,
#   discount_price_cents: 0,
#   stock_quantity: 90,
#   supplier_delay: 7,
#   subcategory: subcategory4)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/81895199/e84bbff7-cfdc-4073-88a1-7cd42adb25b1.png?width=650&height=650&format=jpg&quality=80&fit=bounds")
# file2 = URI.open("https://media.adeo.com/marketplace/LMFR/81895199/74e55730-e84d-4bef-94a9-281d8b3d7018.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_20.photos.attach(io: file1, filename: "product_20_photo.png")
# product_20.photos.attach(io: file2, filename: "product_20_photo.png")

# puts "Produit #{Product.last.id} créé"

# # ////////////////////////////////


# product_21 = Product.create!(
#   name: "Déshumidificateur d'air EQUATION Eq, 12 l/jour",
#   sku: "82887288",
#   description: "Pour un air ambiant idéal , un taux d'humidité entre 40 à 60% est recommandé. Pour le mesurer si vous n'êtes pas encore équipé nous vous conseillons l'achat d'un thermomètre hygromètre.


#   Des signes peuvent vous alerter : des vêtements souvent humides, des murs qui perlent, la formation de moisissures et de champignons, des peintures et papiers peints qui gondolent, des tâches sur les murs,...


#   Un air trop humide peut provoquer des problèmes de santé tels que l'asthme ou la bronchite, des troubles occulaires ou musculaires. Il faut donc s'assurer que le taux d'humidité de sa maison n'est pas trop important.",
#   price_cents: 1,
#   discount_price_cents: 0,
#   stock_quantity: 47,
#   supplier_delay: 21,
#   subcategory: subcategory5)
# file1 = URI.open("https://media.adeo.com/marketplace/LMFR/82887286/1655297.jpeg?width=650&height=650&format=jpg&quality=80&fit=bounds")
# product_21.photos.attach(io: file1, filename: "product_21_photo.png")


# ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////

#
# product_2 = Product.create!(
#   name: "",
#   sku: "",
#   description: "",
#   price_cents: 1,
#   discount_price_cents: 0,
#   subcategory: subcategory1)
# file1 = URI.open("")
# file2 = URI.open("")
# file3 = URI.open("")
# product_2.photos.attach(io: file1, filename: "product_2_photo.png")
# product_2.photos.attach(io: file2, filename: "product_2_photo.png")
# product_2.photos.attach(io: file3, filename: "product_2_photo.png")

# # ////////////////////////////////
