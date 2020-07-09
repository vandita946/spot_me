# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Milestone.destroy_all
Connection.destroy_all
Goal.destroy_all
User.destroy_all


owner = User.new(firstname: "Goal", lastname: "Owner", email: "owner@spotme.com", password: "123456")
owner.save
puts "created owner"

buddy = User.new(firstname: "Buddy", lastname: "Girl", email: "buddy@spotme.com", password: "123456")
buddy.save
puts "created buddy"

goal_1 = Goal.new(title: "Write a book", description: "I want to finally write the novel idea I've had for years!", deadline: Date.today + 100, user_id: owner.id, status: "In Progress")
goal_1.save
puts "#{owner.firstname} #{owner.lastname} is going to #{goal_1.title}"

milestone_1 = Milestone.new(name: "Buy a notebook", deadline: Date.today - 1, goal_id: goal_1.id)
milestone_1.save

# completion_message = CompletionMessage.new(content: "Got a cute notebook!", milestone_id: milestone_1.id)
# completion_message.save

milestone_2 = Milestone.new(name: "Decide on title", deadline: Date.today + 20, goal_id: goal_1.id)
milestone_2.save

goal_2 = Goal.new(title: "Lose 10 kg", description: "I wanna get to size 0!!!", start_date: Date.new(2021,1,1), deadline: Date.new(2021,1,1) + 90, user_id: owner.id, status: "Not Started")
puts "#{owner.firstname} #{owner.lastname} is going to #{goal_2.title}"
goal_2.save

connection = Connection.create(owner: owner, buddy: buddy)
puts "created connection between owner and buddy"

puts "created assigned goals"

chatroom_goal = Chatroom.create(topic: goal_1)

puts "created chatroom for goals"

chatroom_connections = Chatroom.create(topic: connection)

puts "created chatroom for connection"

owner_connections = Connection.new(owner_id: owner.id, buddy_id: buddy.id)

puts "connected owner to buddy"

buddy_connections = Connection.new(owner_id: buddy.id, buddy_id: owner.id)

puts "connected buddy to owner"

julien = User.new(firstname: "Julien", lastname: "Conda", email: "julien@spotme.com", password: "123456")
julien.save
puts "created test user"

Connection.new(owner: julien, buddy: buddy).save
Connection.new(owner: julien, buddy: owner).save


puts "created connections for julien"
