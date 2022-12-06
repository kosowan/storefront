OrderItem.destroy_all
Order.destroy_all

Customer.destroy_all
Province.destroy_all

Product.destroy_all
Category.destroy_all
Sale.destroy_all
# provinces
manitoba = Province.create(name: "Manitoba", pst: 0.07, gst: 0.05, hst: 0.00)
alberta = Province.create(name: "Alberta", pst: 0.00, gst: 0.05, hst: 0.00)
british_comumbia = Province.create(name: "British Columbia", pst: 0.07, gst: 0.05, hst: 0.00)
new_brunswick = Province.create(name: "New Brunswick", pst: 0.00, gst: 0.00, hst: 0.15)
newfoundland_and_labrador = Province.create(name: "Newfoundland and Labrador", pst: 0.00, gst: 0.00, hst: 0.15)
northwest_territories = Province.create(name: "Northwest Territories", pst: 0.00, gst: 0.05, hst: 0.00)
nova_scotia = Province.create(name: "Nova Scotia", pst: 0.00, gst: 0.00, hst: 0.15)
nunavut = Province.create(name: "New Brunswick", pst: 0.00, gst: 0.05, hst: 0.00)
ontario = Province.create(name: "Ontario", pst: 0.00, gst: 0.00, hst: 0.13)
prince_edward_island = Province.create(name: "Prince Edward Island", pst: 0.00, gst: 0.00, hst: 0.15)
quebec = Province.create(name: "Quebec", pst: 0.09975, gst: 0.05, hst: 0.00)
saskatchewan = Province.create(name: "Saskatchewan", pst: 0.06, gst: 0.05, hst: 0.00)
yukon = Province.create(name: "Yukon", pst: 0.00, gst: 0.05, hst: 0.00)

# provinces = [

#     { :name => "Alberta", :pst => "0.00", :gst => "0.05", :harmonized => "0.00" },

#     { :name => "British Columbia", :pst => "0.07", :gst  => "0.05", :harmonized => "0.00" },

#     { :name => "Manitoba", :pst => "0.07", :gst  => "0.05", :harmonized => "0.00" },

#     { :name => "New Brunswick", :pst => "0.00", :goods_and_services => "0.00", :harmonized => "0.15" },

#     { :name => "Newfoundland and Labrador", :pst => "0.00", :goods_and_services => "0.00", :harmonized => "0.15" },

#     { :name => "Northwest Territories", :pst => "0.00", :goods_and_services => "0.05", :harmonized => "0.00" },

#     { :name => "Nova Scotia", :pst => "0.00", :goods_and_services => "0.00", :harmonized => "0.15" },

#     { :name => "Nunavut", :pst => "0.00", :goods_and_services => "0.05", :harmonized => "0.00" },

#     { :name => "Ontario", :pst => "0.00", :goods_and_services => "0.00", :harmonized => "0.13" },

#     { :name => "Prince Edward Island", :pst => "0.00", :goods_and_services => "0.00", :harmonized => "0.15" },

# ]

# categories
mugs = Category.create(name: "mugs")
plates = Category.create(name: "plates")
bowls = Category.create(name: "bowls")
vases = Category.create(name: "vases")
collections = Category.create(name: "collections")

# sales
not_on_sale = Sale.create(sale_percentage: 1.00)
twenty_five_off = Sale.create(sale_percentage: 0.75)

# products
largeMug = Product.create(
  name: "large mug",
  price: 14.00,
  description: "Large homemade ceramic mug",
  category_id: mugs.id,
  sale_id: not_on_sale.id

  )
abstractMug = Product.create(
  name: "abstract mug",
  price: 16.00,
  description: "Abstract art on a mug.",
  category_id: mugs.id,
  sale_id: not_on_sale.id
  )
mcmplates = Product.create(
  name: "mcm plates",
  price: 12.00,
  description: "Two midcentury modern side plates.",
  category_id: plates.id,
  sale_id: twenty_five_off.id
  )
largePlates = Product.create(
  name: "large plates",
  price: 15.00,
  description: "Two large homemade ceramic plates.",
  category_id: plates.id,
  sale_id: twenty_five_off.id
  )
fruitbowl = Product.create(
  name: "fruit bowl",
  price: 14.00,
  description: "A bowl for fruit.",
  category_id: bowls.id,
  sale_id: not_on_sale.id
  )
soupbowl = Product.create(
  name: "soup bowl",
  price: 14.00,
  description: "A bowl for soup.",
  category_id: bowls.id,
  sale_id: not_on_sale.id
  )
smallvase = Product.create(
  name: "small vase",
  price: 8.00,
  description: "A small vase",
  category_id: vases.id,
  sale_id: not_on_sale.id
  )
largeVase = Product.create(
  name: "large vase",
  price: 13.00,
  description: "Large homemade ceramic vase",
  category_id: vases.id,
  sale_id: not_on_sale.id
  )
dinnerSet = Product.create(
  name: "dinner set",
  price: 36.00,
  description: "Custom ceramic dinner set",
  category_id: collections.id,
  sale_id: not_on_sale.id
  )
superDinnerSet = Product.create(
  name: "super dinner set",
  price: 48.00,
  description: "A complete super dinner set of custom ceramics",
  category_id: collections.id,
  sale_id: not_on_sale.id
  )

#Uncomment line below on first seed.
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?