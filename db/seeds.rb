User.destroy_all
Product.destroy_all
Sale.destroy_all
# Order.destroy_all
# Review.destroy_all

#--- Users ---#
puts 'Creating some users...'

PASSWD = "azerty"
user = User.new(
  first_name: "Jonathan",
  last_name: "Bergerot",
  email: "jobergerot@gmail.com",
  address: "Rue Du Château D'eau, 33000 Bordeaux, France",
  role: 1,
  password: PASSWD
)
user.save!
puts "#{user.first_name} OK !!!"

user = User.new(
  first_name: "Anthony",
  last_name: "Gombert",
  email: "anthonygombert33@gmail.com",
  address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux, France",
  role: 0,
  password: PASSWD
)
user.save!
puts "#{user.first_name} OK !!!"

user = User.new(
  first_name: "Ronan",
  last_name: "Laporte-Guiziou",
  email: "ronan.laporte@gmail.com",
  address: "Rue Du Palais Gallien, 33000 Bordeaux, France",
  role: 1,
  password: PASSWD
)
user.save!
puts "#{user.first_name} OK !!!"

user = User.new(
  first_name: "Florent",
  last_name: "Arène",
  email: "florent.arene@gmail.com",
  address: "51 Cours Pasteur, 33000 Bordeaux, France",
  role: 0,
  password: PASSWD
)
user.save!
puts "#{user.first_name} OK !!!"

puts '....... Users finished!'

#--- Products ---#
puts 'Creating a product ...'
product = Product.new(
  name: "Le pellet c'est trop bon !",
  description: "Les granulés de bois compressés de notre sac de pellets sont la solution de chauffage idéale pour votre maison.",
  store_price: 7,
  reference: 66_899_266,
  weight: 15,
  eco_score: 3,
  user_id: user.id,
  brand: "Crépito"
)
product.save!
puts "#{product.name} OK !!!"
puts '....... Products finished!'

#--- Sales ---#
puts 'Creating some sales ...'
addr = [
  "Place De La Victoire, 33000 Bordeaux, France",
  "Libourne, Gironde, France",
  "34 Rue Léonce Dupeyrat, 33290 Parempuyre, France",
  "6 Avenue Pierre Cérésole, 33600 Pessac, France"
]

sale = Sale.new(
  address: addr[0],
  sale_capacity: 50,
  end_date: Date.today + 4,
  price_reduction: 10,
  progress: 0,
  product_id: product.id
)
sale.save!

sale = Sale.new(
  address: addr[1],
  sale_capacity: 100,
  end_date: Date.today + 10,
  price_reduction: 12,
  progress: 0,
  product_id: product.id
)
sale.save!

sale = Sale.new(
  address: addr[2],
  sale_capacity: 150,
  end_date: Date.today + 14,
  price_reduction: 20,
  progress: 0,
  product_id: product.id
)
sale.save!

sale = Sale.new(
  address: addr[3],
  sale_capacity: 200,
  end_date: Date.today + 24,
  price_reduction: 30,
  progress: 0,
  product_id: product.id
)
sale.save!

puts '....... Sales finished!'
