require "faker"
require "open-uri"
require "yaml"

User.destroy_all


address_paris = [
  "65 Faubourg Saint Honoré Paris",
  "69 Rue de Turbigo, 75003 Paris",
  "14 Rue de la Font au Roi, 75011 Paris",
  "101 Rue Saint-Maur, 75011 Paris",
  "9 Rue de la Monnaie, 75001 Paris",
]

address_toulouse = [
  "1 rue Colette, 31200 Toulouse",
  "57 rue Alsace Lorraine, 31000 Toulouse",
  "1 Place Etienne Esquirol, 31000 Toulouse",
  "10 rue Pargaminieres, 31000 Toulouse",
]

address_lille = [
  "216 Rue Léon Gambetta, 59000 Lille",
  "2 Rue du Faubourg des Postes, 59000 Lille",
  "75 Rue des Postes, 59000 Lille",
  "42 Rue Gantois, 59000 Lille",
]

description_generator = [
  "The Beatles pinball machine will immerse players in 1960’s Beatlemania and feature nine timeless hit songs. The retro-themed playfield features four flippers, eleven drop targets, eight stand-up targets, multiple skill shots, two opto-spinners, a ball-catching magnet and a magnetic spinning record disc in the center of the playfield.",
  "Stern Pinball’s Star Wars™ Pin™ is a new stylish, affordable and fun pinball machine designed and engineered for the home.  Stern’s new Star Wars™ Pin™ immerses players in the dynamic Star Wars™ galaxy.  The Pin™ is packed with features that provide players with an irresistible game experience including select speech and footage from the original Star Wars™ trilogy, color-changing playfield inserts, a custom sculpted Death Star, and a custom sculpted and interactive TIE fighter.",
  "On his unrelenting quest for intergalactic omnipotent power, it’s a race to hunt down and recover the six Infinity Gems before Thanos gets his hands on them.  It’s up to the player to stop Thanos and the Black Order from succeeding in this action-packed pinball experience."
]



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

puts "creating default user"
user2 = User.new(first_name: "toto", last_name: "Fils de Jack", email: "jack@gmail.com", password: "lewagon")
puts "add a avatar image..."
avatar = URI.open(list_url_avatar.sample)
user2.avatar.attach(io: avatar, filename: "image")
puts " try to save user - #{user2}"
user2.save!


puts "creating default user"
user5 = User.new(first_name: "Michel", last_name: "Fils de Jack", email: "diane@gmail.com", password: "lewagon")
puts "add a avatar image..."
avatar = URI.open(list_url_avatar.sample)
user5.avatar.attach(io: avatar, filename: "image")
puts " try to save user - #{user5}"
user5.save!
