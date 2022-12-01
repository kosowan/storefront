Product.destroy_all
Category.destroy_all
Customer.destroy_all
Province.destroy_all

# provinces
manitoba = Province.create(name: "Manitoba", pst: 0.05, gst: 0.07, hst: 0.00)

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

# products
largeMug = Product.create(
  name: "large mug",
  price: 14.00,
  description: "Large homemade ceramic mug",
  category_id: mugs.id
  )
abstractMug = Product.create(
  name: "abstract mug",
  price: 16.00,
  description: "Abstract art on a mug.",
  category_id: mugs.id
  )
mcmplates = Product.create(
  name: "mcm plates",
  price: 12.00,
  description: "Two midcentury modern side plates.",
  category_id: plates.id
  )
largePlates = Product.create(
  name: "large plates",
  price: 15.00,
  description: "Two large homemade ceramic plates.",
  category_id: plates.id
  )
fruitbowl = Product.create(
  name: "fruit bowl",
  price: 14.00,
  description: "A bowl for fruit.",
  category_id: bowls.id
  )
soupbowl = Product.create(
  name: "soup bowl",
  price: 14.00,
  description: "A bowl for soup.",
  category_id: bowls.id
  )
smallvase = Product.create(
  name: "small vase",
  price: 8.00,
  description: "A small vase",
  category_id: vases.id
  )
largeVase = Product.create(
  name: "large vase",
  price: 13.00,
  description: "Large homemade ceramic vase",
  category_id: vases.id
  )
dinnerSet = Product.create(
  name: "dinner set",
  price: 36.00,
  description: "Custom ceramic dinner set",
  category_id: collections.id
  )
superDinnerSet = Product.create(
  name: "super dinner set",
  price: 48.00,
  description: "A complete super dinner set of custom ceramics",
  category_id: collections.id
  )

#Uncomment line below on first seed.
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?