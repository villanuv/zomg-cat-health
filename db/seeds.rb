case Rails.env
when 'development', 'production'
  User.create!(username: "admin", password: "password", password_confirmation: "password")

  Cat.create!(
    url: "http://static2.businessinsider.com/image/4f3433986bb3f7b67a00003c/a-parasite-found-in-cats-could-be-manipulating-our-brains.jpg", 
    description: "wide-eyed and worried kitten",
    user_id: 1
  )

  Cat.create!(
    url: "http://cdn2.hellogiggles.com/wp-content/uploads/2014/02/17/kitten-cute-fluffyfunny-cat-kitten-fluffy-cute-animal-joke-silly-pet-scary-comedy-tshirt-pkgbbppi.jpg",
    description: "furry kitten as grumpy cat",
    user_id: 1
  )

  Cat.create!(
    url: "https://s-media-cache-ak0.pinimg.com/736x/41/ae/de/41aedefbf1961350e3e3df81d723dfac.jpg",
    description: "sad kitty, poor kitty",
    user_id: 2
  )

  Cat.create!(
    url: "https://catloves9.files.wordpress.com/2011/06/cute-kitten.jpg",
    description: "this cat is sorry for something",
    user_id: 1
  )

  Cat.create!(
    url: "https://s-media-cache-ak0.pinimg.com/originals/6b/45/5d/6b455d864ecce4270da03f9ff008736b.jpg",
    description: "Pikachu! Meow?",
    user_id: 2
  )

  # 25.times do
  #   vote = Vote.new 
  #   vote.option = rand(0..1)
  #   vote.ip_address = Faker::Internet.ip_v4_address
  #   vote.cat_id = Cat.all.sample.id
  #   vote.save
  # end
end

