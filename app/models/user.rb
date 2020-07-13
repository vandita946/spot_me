class User < ApplicationRecord
  attr_accessor :goal, :contact

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owner_connections, :class_name => 'Connection', :foreign_key => 'owner_id'
  has_many :buddy_connections, :class_name => 'Connection', :foreign_key => 'buddy_id'
  has_many :goals, dependent: :destroy
  has_many :messages
  has_many :connections, through: :owner_connections, source: :buddy
  # has_many :connections, through: :buddy_connections, source: :owner
  has_many :fans, through: :buddy_connections, source: :owner
  # has_many :goal_connections, through: :connections, source: :goal
  # has_many :buddies, through: :goals_connection, source: :buddy

  after_save :generate_connection

  def generate_connection
    if self.goal
      connection = Connection.new(owner_id: Goal.find(self.goal).user_id, buddy_id: self.id)
      connection.save!
      goal_connection = GoalConnection.create(connection_id: connection.id, goal_id: self.goal)
    elsif self.contact
      connection = Connection.new(owner_id: self.contact, buddy_id: self.id)
      connection.save!
    end
  end

  def buddies
    buddies = []
    self.goals.each do |goal|
      goal.connections.each do |connection|
        buddies << connection.buddy
      end
    end
    buddies
  end

  def buddyofs
    buddyofs = []
    Goal.all.each do |goal|
      goal.goal_connections.each do |gc|
        buddyofs << gc.connection.owner if gc.connection.buddy == self
      end
    end
  buddyofs
  end
end
