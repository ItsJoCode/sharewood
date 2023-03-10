Creator.destroy_all
Order.destroy_all
Sale.destroy_all
Product.destroy_all
User.destroy_all
# Review.destroy_all

################################
#----------- Users ------------#
################################
puts 'Creating some users...'

PASSWD = "azerty"
jo = User.new(
  first_name: "Jonathan",
  last_name: "Bergerot",
  email: "jobergerot@gmail.com",
  address: "Rue Du Château D'eau, 33000 Bordeaux, France",
  role: 1,
  password: PASSWD
)
jo.save!
puts "#{jo.first_name} OK !!!"

antho = User.new(
  first_name: "Anthony",
  last_name: "Gombert",
  email: "anthonygombert33@gmail.com",
  address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux, France",
  role: 1,
  password: PASSWD
)
antho.save!
puts "#{antho.first_name} OK !!!"

ro = User.new(
  first_name: "Ronan",
  last_name: "Laporte-Guiziou",
  email: "ronan.laporte@gmail.com",
  address: "Rue Du Palais Gallien, 33000 Bordeaux, France",
  role: 0,
  password: PASSWD
)
ro.save!
puts "#{ro.first_name} OK !!!"

flo = User.new(
  first_name: "Florent",
  last_name: "Arène",
  email: "florent.arene@gmail.com",
  address: "51 Cours Pasteur, 33000 Bordeaux, France",
  role: 1,
  password: PASSWD
)
flo.save!
puts "#{flo.first_name} OK !!!"

puts '....... Users finished!'

################################
#---------- Products ----------#
################################
puts 'Creating some products ...'

crepito = Product.new(
  name: "Je suis CRÉPITO !",
  description: "Les granulés de bois compressés de notre sac de pellets sont la solution de chauffage idéale pour votre maison.",
  store_price: 7,
  reference: 66_899_266,
  weight: 15,
  eco_score: 3,
  user_id: jo.id,
  brand: "Crépito"
)
crepito.save!
puts "#{crepito.name} OK !!!"

woodstock = Product.new(
  name: "Je suis WOODSTOCK !",
  description: "Chauffez votre maison de manière responsable avec notre sac de pellets de haute qualité.",
  store_price: 8,
  reference: 86_123_145,
  weight: 15,
  eco_score: 2,
  user_id: antho.id,
  brand: "Woodstock"
)
woodstock.save!
puts "#{woodstock.name} OK !!!"

pellematic = Product.new(
  name: "Je suis PELLEMATIC !",
  description: "Optez pour notre sac de pellets de qualité supérieure et découvrez une solution de chauffage respectueuse de l'environnement.",
  store_price: 3,
  reference: 11_645,
  weight: 5,
  eco_score: 3,
  user_id: flo.id,
  brand: "Pellematic"
)
pellematic.save!
puts "#{pellematic.name} OK !!!"

puts '....... Products finished!'

################################
#----------- Sales ------------#
################################
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
  product_id: crepito.id
)
sale.save!
puts "sale 1 : #{crepito.name} pour #{jo.first_name} !!!"

sale = Sale.new(
  address: addr[1],
  sale_capacity: 100,
  end_date: Date.today + 10,
  price_reduction: 12,
  progress: 0,
  product_id: woodstock.id
)
sale.save!
puts "sale 2 : #{woodstock.name} pour #{antho.first_name} !!!"

sale = Sale.new(
  address: addr[2],
  sale_capacity: 150,
  end_date: Date.today + 14,
  price_reduction: 20,
  progress: 0,
  product_id: pellematic.id
)
sale.save!
puts "sale 3 : #{pellematic.name} pour #{flo.first_name} !!!"

sale = Sale.new(
  address: addr[3],
  sale_capacity: 200,
  end_date: Date.today + 24,
  price_reduction: 30,
  progress: 0,
  product_id: pellematic.id
)
sale.save!
puts "sale 4 : #{pellematic.name} pour #{flo.first_name} !!!"
puts "et aucune sale pour #{ro.first_name} !!!"

puts '....... Sales finished!'

################################
#---------- Orders ----------#
################################
puts "Creating some orders ..."

order = Order.new(
  capacity: 0,
  sale_id: sale.id,
  user_id: ro.id
)
order.save!
puts "mais création d'une order pour #{ro.first_name} !!!"

puts '....... Orders finished!'

################################
#---------- Creators ----------#
################################
puts "Creating some creators ..."

creator = Creator.new(
  name: antho.first_name,
  description: "Après avoir travaillé pendant plusieurs années en tant que commercial et entrepreneur, j'ai décidé de me lancer dans le développement web en suivant la formation du Wagon.",
  photo_url: "https://ca.slack-edge.com/T02NE0241-U04K2D8070B-3c6ce5975412-512"
)
creator.save!
puts "créateur : #{antho.first_name} ok !!!"

creator = Creator.new(
  name: jo.first_name,
  description: "I'm a software engineer, i worked two years in aeronautics domain. Today, I want to learn some modern technologies in web development.",
  photo_url: "https://avatars.githubusercontent.com/u/122153323?v=4"
)
creator.save!
puts "créateur : #{jo.first_name} ok !!!"

creator = Creator.new(
  name: ro.first_name,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.",
  photo_url: "https://ca.slack-edge.com/T02NE0241-U04K4VAV97E-726d7ba7c785-512"
)
creator.save!
puts "créateur : #{ro.first_name} ok !!!"

creator = Creator.new(
  name: flo.first_name,
  description: "Experienced audiovisual and IT professional with strong technical skills in streaming, video production, and audio-visual installations. I am a self-motivated and creative person with a strong sense of responsibility and a passion for technology.",
  photo_url: "https://ca.slack-edge.com/T02NE0241-U04JWALJ3AA-fe09f00b5bb5-512"
)
creator.save!
puts "créateur : #{flo.first_name} ok !!!"

puts '....... Creators finished!'
