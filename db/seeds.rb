Game.destroy_all
User.destroy_all

require "faker"
require "open-uri"

list_url_avatar = [
  "https://res.cloudinary.com/dyzqasku8/image/upload/v1629191122/avatar_seed_neverboard/avatar_1_wqluot.png",
  "https://res.cloudinary.com/dyzqasku8/image/upload/v1629191122/avatar_seed_neverboard/avatar_3_dreqgr.png",
  "https://res.cloudinary.com/dyzqasku8/image/upload/v1629191122/avatar_seed_neverboard/avatar_2_sbiy13.png",
]

puts "creating default user"
default = User.new(first_name: "Michel", last_name: "Fils de Jack", email: "michel@gmail.com", password: "lewagon")
puts "add a avatar image..."
avatar = URI.open(list_url_avatar.sample)
default.avatar.attach(io: avatar, filename: "image")
puts " try to save user - #{default}"
default.save!

puts "add a game to default user"

michel_games = []
2.times do
  game = Game.new(
    category: Game::CATEGORIES.sample,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: (10..30).to_a.sample),
    price: (20..200).to_a.sample,
  )
  list_url_games = {
    "pinball" => "https://upload.wikimedia.org/wikipedia/en/f/fc/PinballIndianaJonesOblique.jpg",
    "pool" => "https://www.jmc-billard.com/3695-thickbox_default/snooker-prince-12ft-acajou.jpg",
    "arcade game" => "https://upload.wikimedia.org/wikipedia/commons/3/3f/Donkey_Kong_arcade_at_the_QuakeCon_2005.png",
  }
  puts "adding image to game.."
  game_image = URI.open(list_url_games[game.category.downcase])
  game.photos.attach(io: game_image, filename: "images")
  puts "image added, attributing a user.."
  game.user = default
  puts "user attributed, try to save.."
  game.save!
  michel_games << game
end



puts "default user created, add some random users.."
puts "creating 10 users..."
users = []
i = 1
10.times do
  puts "Creating user n°#{i}"
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password,
    email: Faker::Internet.email,
  )

  avatar = URI.open(list_url_avatar.sample)
  user.avatar.attach(io: avatar, filename: "image")
  sleep 3
  puts "user n°#{i} created, try to save..."
  user.save!
  users << user
  puts "user n°#{i} saved !"
  i += 1
end

  games = []
20.times do
  game = Game.new(
    category: Game::CATEGORIES.sample,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: (10..30).to_a.sample),
    price: (20..200).to_a.sample
  )
  list_url_games = {
    "pinball" => "https://upload.wikimedia.org/wikipedia/en/f/fc/PinballIndianaJonesOblique.jpg",
    "pool" => "https://www.jmc-billard.com/3695-thickbox_default/snooker-prince-12ft-acajou.jpg",
    "arcade game" => "https://upload.wikimedia.org/wikipedia/commons/3/3f/Donkey_Kong_arcade_at_the_QuakeCon_2005.png"
  }
  puts "adding image to game.."
  game_image = URI.open(list_url_games[game.category.downcase])
  game.photos.attach(io: game_image, filename: "images")
  sleep 3
  puts "image added, attributing a user.."
  game.user = users.sample
  puts "user attributed, try to save.."
  game.save!
  games << game
end

puts "creating bookings.."
  Booking.create!(
    start_date: Date.today,
    end_date: Date.today() + 2,
    status: 0,
    user: default,
    game: games.sample
  )

  Booking.create!(
    start_date: Date.today,
    end_date: Date.today() + 4,
    status: 1,
    user: default,
    game: games.sample
  )

  Booking.create!(
    start_date: Date.today() - 1,
    end_date: Date.today() + 1,
    status: 2,
    user: default,
    game: games.sample
  )

  Booking.create!(
    start_date: Date.today,
    end_date: Date.today() + 2,
    status: 0,
    user: users.sample,
    game: michel_games.sample
  )

  Booking.create!(
    start_date: Date.today,
    end_date: Date.today() + 4,
    status: 1,
    user: users.sample,
    game: michel_games.sample
  )

  Booking.create!(
    start_date: Date.today() - 1,
    end_date: Date.today() + 1,
    status: 2,
    user: users.sample,
    game: michel_games.sample
  )
