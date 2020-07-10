# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Chatroom.destroy_all
GoalConnection.destroy_all
Connection.destroy_all
CompletionMessage.destroy_all
Milestone.destroy_all
Goal.destroy_all
User.destroy_all


# owner = User.new(firstname: "Goal", lastname: "Owner", email: "owner@spotme.com", password: "123456")
# owner.save
# puts "created owner"

# buddy = User.new(firstname: "Buddy", lastname: "Girl", email: "buddy@spotme.com", password: "123456")
# buddy.save
# puts "created buddy"

julien = User.new(firstname: "Julien", lastname: "Conda", email: "julien@spotme.com", password: "123456")
julien.save

joel = User.new(firstname: "Joel", lastname: "Chen", email: "joel@spotme.com", password: "123456")
joel.save

vandita = User.new(firstname: "Van", lastname: "Dita", email: "vandita@spotme.com", password: "123456")
vandita.save

claire = User.new(firstname: "Claire", lastname: "March", email: "claire@spotme.com", password: "123456")
claire.save

puts "created 4 named users"

goal_1 = Goal.new(title: "Write a book", description: "I want to finally write the novel idea I've had for years!", deadline: Date.today + 100, user_id: julien.id, status: "In Progress")
goal_1.save
puts "#{julien.firstname} #{julien.lastname} is going to #{goal_1.title}"

milestone_1 = Milestone.new(name: "Buy a notebook", deadline: Date.today - 1, goal_id: goal_1.id)
milestone_1.save

# completion_message = CompletionMessage.new(content: "Got a cute notebook!", milestone_id: milestone_1.id)
# completion_message.save

milestone_2 = Milestone.new(name: "Decide on title", deadline: Date.today + 20, goal_id: goal_1.id)
milestone_2.save

goal_2 = Goal.new(title: "Lose 10 kg", description: "I wanna get to size 0!!!", start_date: Date.new(2021,1,1), deadline: Date.new(2021,1,1) + 90, user_id: julien.id, status: "Not Started")
goal_2.save
puts "#{julien.firstname} #{julien.lastname} is going to #{goal_2.title}"


# connection = Connection.create(owner: owner, buddy: buddy)
# puts "created connection between owner and buddy"

# owner_connections = Connection.new(owner_id: owner.id, buddy_id: buddy.id).save

# puts "connected owner to buddy"

# buddy_connections = Connection.new(owner_id: buddy.id, buddy_id: owner.id).save

# puts "connected buddy to owner"



connect_1 = Connection.new(owner: julien, buddy: joel)
connect_1.save
puts "created 1 connection for julien"

connect_2 = Connection.new(owner: julien, buddy: claire)
connect_2.save
puts "created 2 connections for julien"

connect_3 = Connection.new(owner: claire, buddy: julien)
connect_3.save
connect_4 = Connection.new(owner: vandita, buddy: julien)
connect_4.save
connect_5 = Connection.new(owner: joel, buddy: claire)
connect_5.save
connect_6 = Connection.new(owner: julien, buddy: vandita)
connect_6.save
puts "created followers for julien"

goal_3 = Goal.new(title: "Grow 20cm", description: "I wanna be very tall!!!", start_date: Date.new(2021,2,3), deadline: Date.new(2021,3,5) + 40, user_id: claire.id, status: "Not Started")
goal_3.save

puts "created goal 3"

GoalConnection.new(connection_id: connect_1.id, goal_id: goal_1.id).save #julien, joel
GoalConnection.new(connection_id: connect_6.id, goal_id: goal_2.id).save #julien, vandita
GoalConnection.new(connection_id: connect_3.id, goal_id: goal_3.id).save #claire, julien

puts "created 3 goal connections"

# CREATE CHATROOMS - do not remove

Chatroom.create(topic: goal_1)
Chatroom.create(topic: goal_2)
Chatroom.create(topic: goal_3)

puts "created chatroom for goals"

Chatroom.create(topic: connect_1)
Chatroom.create(topic: connect_2)
Chatroom.create(topic: connect_3)
Chatroom.create(topic: connect_4)
Chatroom.create(topic: connect_5)
Chatroom.create(topic: connect_6)

puts "created chatroom for connection"

# END

# Users: julien
# Goals: Goal 1 - julien (joel), Goal 2 - julien(claire), Goal 3 - claire(julien)
# Connections: joel, claire, vandita
# Buddy: joel, vandita
# Buddyof: claire
# Fans: claire, vandita
