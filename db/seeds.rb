# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = User.new(name: "joel", email: "joelchenjg@gmail.com", password: "123456")
owner.save
puts "created owner"

buddy = User.new(name: "julien", email: "julien@gmail.com", password: "123456")
buddy.save
puts "created buddy"

connection = Connection.create(owner: owner, buddy: buddy)
puts "created connection between owner and buddy"

goal_1 = Goal.create(title: "Eat food", description: "Eat nasi lemak", status: "In Progress", deadline: Date.today + 5, progress: 0.0, user_id: owner.id)

goal_2 = Goal.create(title: "Dieting", description: "Not eating nasi lemak", status: "In Progress", deadline: Date.today + 8, progress: 0.0, user_id: buddy.id)

puts "created assigned goals" 

chatroom_goal = Chatroom.create(topic: goal_1)

puts "created chatroom for goals"

chatroom_connections = Chatroom.create(topic: connection)

puts "created chatroom for connection"
