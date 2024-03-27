# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create hotels
hotel1 = Hotel.create(name: 'Hotel A', location: 'pune')
hotel2 = Hotel.create(name: 'Hotel B', location: 'mumbai')
hotel3 = Hotel.create(name: 'Hotel C', location: 'delhi')

# Create rooms for each hotel
room1 = hotel1.rooms.create(number: 101)
room2 = hotel1.rooms.create(number: 102)
room3 = hotel2.rooms.create(number: 201)
room4 = hotel2.rooms.create(number: 202)
room5 = hotel3.rooms.create(number: 301)
room6 = hotel3.rooms.create(number: 302)

# Create users
user1 = User.create(name: 'User 1', email: 'user1@example.com')
user2 = User.create(name: 'User 2', email: 'user2@example.com')

# Bookings
Booking.create(check_in_date: '2024-04-01', check_out_date: '2024-04-03', number_of_rooms: 1, user: user1, room: room1)
Booking.create(check_in_date: '2024-04-05', check_out_date: '2024-04-07', number_of_rooms: 1, user: user1, room: room2)
Booking.create(check_in_date: '2024-04-10', check_out_date: '2024-04-12', number_of_rooms: 1, user: user2, room: room3)