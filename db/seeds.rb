# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = User.new(name: "Goal Owner", email: "owner@spotme.com", password: "123456")
owner.save
puts "created owner"

buddy = User.new(name: "Buddy", email: "buddy@spotme.com", password: "123456")
buddy.save
puts "created buddy"

goal_1 = Goal.create(title: "Write a book", description: "I want to finally write the novel idea I've had for years!", deadline: Date.today + 100, user_id: owner.id)

milestone_1 = Milestone.create(name: "Buy a notebook", deadline: Date.today - 1, goal_id: goal_1.id, is_completed: true)
completion_message = CompletionMessage.create(content: "Got a cute notebook!", milestone_id: milestone_1.id)

milestone_2 = Milestone.create(name: "Decide on title", deadline: Date.today + 20, goal_id: goal_1.id)

goal_2 = Goal.create(title: "Lose 10 kg", description: "I wanna get to size 0!!!", start_date: Date.new(2021,1,1), deadline: Date.new(2021,1,1) + 90, user_id: owner.id)

puts "created assigned goals" 

