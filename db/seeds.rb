require "open-uri"

User.destroy_all
Product.destroy_all
Shop.destroy_all
Coupon.destroy_all
Category.destroy_all
Subcategory.destroy_all

puts "creation users"
user_one = User.create!(email: "aurelien@gmail.com", password: "123456", admin: true)
user_two = User.create!(email: "jonathan@gmail.com", password: "123456", admin: false)
user_three = User.create!(email: "marion@gmail.com", password: "123456", admin: false)
user_four = User.create!(email: "kevin@gmail.com", password: "123456", admin: false)

puts "#{User.count} utilisateurs créés"
puts "1 admin, 3 non admins"

puts "creation des produits"

category1 = Category.create!(name:"ameublement")
puts "category 1 créé"
    subcategory1 = Subcategory.create!(name:"table", category_id: 1)
      puts "subcategory 1 créé"
    subcategory2 = Subcategory.create!(name:"chaise", category_id: 1)
      puts "subcategory 2 créé"
    subcategory3 = Subcategory.create!(name:"literie", category_id: 1)
      puts "subcategory 3 créé"
category2 = Category.create!(name:"vêtements")
puts "category 2 créé"
    subcategory4 = Subcategory.create!(name:"plante", category_id: 2)
      puts "subcategory 4 créé"
    subcategory5 = Subcategory.create!(name:"chaussures", category_id: 2)
      puts "subcategory 5 créé"
    subcategory6 = Subcategory.create!(name:"chemise", category_id: 2)
      puts "subcategory 6 créé"
    subcategory7 = Subcategory.create!(name:"design", category_id: 2)
      puts "subcategory 7 créé"
category3 = Category.create!(name:"decoration")
puts "category 3 créé"
    subcategory8 = Subcategory.create!(name:"boisson", category_id: 3)
      puts "subcategory 8 créé"
    subcategory9 = Subcategory.create!(name:"friandise", category_id: 3)
      puts "subcategory 9 créé"
    subcategory10 = Subcategory.create!(name:"legumes", category_id: 3)
      puts "subcategory 10 créé"
category4 = Category.create!(name:"alimentation")
puts "category 4 créé"
    subcategory11 = Subcategory.create!(name:"divers", category_id: 4)
      puts "subcategory 11 créé"
category5 = Category.create!(name:"autres")
puts "category 5 créé"



product_one = Product.create!(name: "Bocal en verre", sku: "stripe-veut-un-sku", description: "Conservation longue. Style épuré. Très résistant. Nombreux modèles disponibles.", price_cents: 1000, subcategory_id: 1)
file1 = URI.open("https://images.unsplash.com/photo-1594813591867-02e797aa4581?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1914&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1563635707796-b4b9d6007a8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1581515286364-d47e468ab4ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80")
product_one.photos.attach(io: file1, filename: "product_one_photo.png")
product_one.photos.attach(io: file2, filename: "product_one_photo.png")
product_one.photos.attach(io: file3, filename: "product_one_photo.png")

product_two = Product.create!(name: "Assiette plate", sku: "stripe-veut-un-sku", description: "Large choix disponible. Véritable porcelaine de qualité.", price_cents: 2000, subcategory_id: 1)
file1 = URI.open("https://images.unsplash.com/photo-1499028203764-8669cfd05719?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1612293905877-b6c91ff16212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1563136838-1e0f8d93e475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80")
product_two.photos.attach(io: file1, filename: "product_two_photo.png")
product_two.photos.attach(io: file2, filename: "product_two_photo.png")
product_two.photos.attach(io: file3, filename: "product_two_photo.png")

product_three = Product.create!(name: "Couteau suisse", sku: "stripe-veut-un-sku", description: "Véritable couteau suisse. Très bonne qualité. Garantie de 10 ans.", price_cents: 4000, subcategory_id: 6)
file1 = URI.open("https://images.unsplash.com/photo-1605468424365-bac89e69cc4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1589891948959-533f1626f1b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1615127717889-8945dba1f05a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
product_three.photos.attach(io: file1, filename: "product_three_photo.png")
product_three.photos.attach(io: file2, filename: "product_three_photo.png")
product_three.photos.attach(io: file3, filename: "product_three_photo.png")

product_four = Product.create!(name: "Théière", sku: "stripe-veut-un-sku", description: "Très belle théière. Motif fleuri.", price_cents: 5000, subcategory_id: 3)
file1 = URI.open("https://images.unsplash.com/photo-1584799187619-6473f62c2a9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1584799187460-bf6f66895eeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1584799188216-0ec4f4975f39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
product_four.photos.attach(io: file1, filename: "product_four_photo.png")
product_four.photos.attach(io: file2, filename: "product_four_photo.png")
product_four.photos.attach(io: file3, filename: "product_four_photo.png")

product_five = Product.create!(name: "Cafetière italienne", sku: "stripe-veut-un-sku", description: "Véritable cafetière italienne pour café déjà moulu. Coloris rouge uniquement.", price_cents: 4000, subcategory_id: 4)
file1 = URI.open("https://images.unsplash.com/photo-1616662707932-350e6e599ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1616662727298-202dc245ed5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1616662707703-b4e4ab08e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
product_five.photos.attach(io: file1, filename: "product_five_photo.png")
product_five.photos.attach(io: file2, filename: "product_five_photo.png")
product_five.photos.attach(io: file3, filename: "product_five_photo.png")

puts "#{Product.count} produits créés"

Shop.create!(user: User.where(admin: true).first, name: "L'@telier de Lysiane", description: "Magasin de décoration de Noël artisanales", phone: "02.43.15.42.56", siren: "123456789", address: "7 rue de la Brèche Beaulieu, 77610 Crèvecoeur-en-Brie", card: "card3", themebgcolor: "white", themefont: "'Courier New', Courier, monospace" )

puts "#{Shop.count} Shop générée"
