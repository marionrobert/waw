require "open-uri"

User.destroy_all
Product.destroy_all
Shop.destroy_all

puts "creation users"
user_one = User.create!(email: "aurelien@gmail.com", password:"123456", admin: true)
user_two = User.create!(email: "jonathan@gmail.com",   password:"123456", admin: true)
user_three = User.create!(email: "marion@gmail.com", password:"123456", admin: true)
user_four = User.create!(email: "kevin@gmail.com", password:"123456", admin: true)

puts "#{User.count} utilisateurs créés"

puts "creation des produits"

product_one = Product.create!(name: "Bocal en verre", sku: "stripe-veut-un-sku", description: "Conservation longue. Style épuré. Très résistant. Nombreux modèles disponibles.", price_cents: 1000)
file1 = URI.open("https://images.unsplash.com/photo-1594813591867-02e797aa4581?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1914&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1563635707796-b4b9d6007a8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1581515286364-d47e468ab4ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80")
product_one.photos.attach(io: file1, filename: "product_one_photo.png")
product_one.photos.attach(io: file2, filename: "product_one_photo.png")
product_one.photos.attach(io: file3, filename: "product_one_photo.png")

product_two = Product.create!(name: "Assiette plate", sku: "stripe-veut-un-sku", description: "Large choix disponible. Véritable porcelaine de qualité.", price_cents: 2000)
file1 = URI.open("https://images.unsplash.com/photo-1499028203764-8669cfd05719?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1612293905877-b6c91ff16212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1563136838-1e0f8d93e475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80")
product_two.photos.attach(io: file1, filename: "product_two_photo.png")
product_two.photos.attach(io: file2, filename: "product_two_photo.png")
product_two.photos.attach(io: file3, filename: "product_two_photo.png")

product_three = Product.create!(name: "Couteau suisse", sku: "stripe-veut-un-sku", description: "Véritable couteau suisse. Très bonne qualité. Garantie de 10 ans.", price_cents: 4000)
file1 = URI.open("https://images.unsplash.com/photo-1605468424365-bac89e69cc4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1589891948959-533f1626f1b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1615127717889-8945dba1f05a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
product_three.photos.attach(io: file1, filename: "product_three_photo.png")
product_three.photos.attach(io: file2, filename: "product_three_photo.png")
product_three.photos.attach(io: file3, filename: "product_three_photo.png")

product_four = Product.create!(name: "Théière", sku: "stripe-veut-un-sku", description: "Très belle théière. Motif fleuri.", price_cents: 5000)
file1 = URI.open("https://images.unsplash.com/photo-1584799187619-6473f62c2a9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1584799187460-bf6f66895eeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1584799188216-0ec4f4975f39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
product_four.photos.attach(io: file1, filename: "product_four_photo.png")
product_four.photos.attach(io: file2, filename: "product_four_photo.png")
product_four.photos.attach(io: file3, filename: "product_four_photo.png")

product_five = Product.create!(name: "Cafetière italienne", sku: "stripe-veut-un-sku", description: "Véritable cafetière italienne pour café déjà moulu. Coloris rouge uniquement.", price_cents: 4000)
file1 = URI.open("https://images.unsplash.com/photo-1616662707932-350e6e599ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
file2 = URI.open("https://images.unsplash.com/photo-1616662727298-202dc245ed5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
file3 = URI.open("https://images.unsplash.com/photo-1616662707703-b4e4ab08e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=773&q=80")
product_five.photos.attach(io: file1, filename: "product_five_photo.png")
product_five.photos.attach(io: file2, filename: "product_five_photo.png")
product_five.photos.attach(io: file3, filename: "product_five_photo.png")

puts "#{Product.count} produits créés"



Shop.create!(user: User.all.sample, name: "Mon magasin", description: "meilleur magasin du monde", phone: "02.43.15.42.56", siren: "123456789", address: "16 villa Gaudelet, 75011 Paris")
