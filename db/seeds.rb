# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(
  first_name: "Kevin",
  last_name: "downs",
  email: "kevindowns@gmail.com",
  password: "heyImKevin"
)

Gallery.create!(
  name: "Hiroshige Gallery",
  address: "2 Chome-10-4 Ebisuminami, Shibuya City, Tokyo 150-0022",
  description: "Welcome to the Hiroshige Gallery, a sanctuary dedicated to celebrating the timeless beauty of ukiyo-e. Named in honor of the legendary Japanese artist Utagawa Hiroshige, our gallery showcases an exquisite collection of his most iconic works, capturing the essence of 19th-century Japan through vibrant landscapes, serene cityscapes, and evocative seasonal scenes. Immerse yourself in the intricate details and rich colors that define Hiroshige’s artistry, and experience the historical and cultural narratives that have inspired generations. Whether you're a connoisseur of Japanese art or a curious visitor, the Hiroshige Gallery offers a tranquil space to explore the profound elegance and enduring legacy of this masterful artist.",
  website: "http://hiroshige-gallery.com/",
  # images: "",
  booking: "[[08162024, 08172024, 08182024, 08192024]]",
  price: 30000,
  user_id: user.id
)

Gallery.create!(
  name: "art gallery closet",
  address: "2 Chome-11-10 霞町ビル 3F, Nishiazabu, Minato City, Tokyo 106-0031",
  description: "We have been providing professional art consulting services in Tokyo for over 15 years working with high profile architects, interior designers, and furniture brands. From a wide selection of emerging and established contemporary artists, cultivating personal relationships with each one to ensure we can source the suitable piece for a client.",
  website: "https://www.gallery-closet.jp/",
  # images: "",
  booking: "[[09012024, 09022024]]",
  price: 25000,
  user_id: user.id
)

Gallery.create!(
  name: "KUKO Cafe & Gallery",
  address: "33-12 Yoyogi, Shibuya City, Tokyo",
  description: "Ambient space to enjoy art and coffee. Welcoming to creatives of all levels of experience and all forms of media.",
  website: "https://www.facebook.com/profile.php?id=100054482739047",
  # images: "",
  booking: "[[08102024, 08112024, 08122024], [09242024, 09252024, 09262024, 09272024, 09282024,]]",
  price: 5000,
  user_id: user.id
)

Gallery.create!(
  name: "Art Gallery Daijiro",
  address: "2 Chome-9-11 Monzennakacho, Koto City, Tokyo",
  description: "Small two floor gallery near Monzennakacho station. Individual and group show of tradition form medias welcome.",
  website: "https://www.gallerydaijiro.tokyo",
  # images: "",
  booking: "[[09132024, 09142024, 09152024, 09162024 ], [09222024, 09232024, 09242024, 09252024, 09262024]]",
  price: 10000,
  user_id: user.id
)

Gallery.create!(
  name: "Tomio Koyama Gallery",
  address: "〒106-0032 Tokyo, Minato City, Roppongi, 6 Chome-5-24 complex665 2F",
  description: "The Tomio Koyama Gallery is a prominent contemporary art gallery based in Tokyo, Japan, renowned for its innovative exhibitions and support of both emerging and established artists. It showcases a diverse range of artworks, including paintings, sculptures, and multimedia pieces, and is celebrated for its dynamic approach to modern art. The gallery fosters a rich cultural dialogue by presenting both Japanese and international artists, making it a pivotal space in the global art scene.",
  website: "http://www.tomiokoyamagallery.com/",
  # images: "",
  booking: "[[09252024, 09262024, 09272024, 09282024 ], [09032024, 09042024, 09052024, 09062024, 09072024]]",
  price: 9000,
  user_id: user.id
)
