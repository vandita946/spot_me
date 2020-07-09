class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owner_connections, :class_name => 'Connection', :foreign_key => 'owner_id'
  has_many :buddy_connections, :class_name => 'Connection', :foreign_key => 'buddy_id'
  has_many :goals
  has_many :messages
  has_many :connections, through: :owner_connections, source: :buddy
  has_many :fans, through: :buddy_connections, source: :owner
  # has_many :goal_connections, through: :goals, source: :goal
  # has_many :buddies, through: :goals_connection, source: :buddy

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
    self.goals.each do |goal|
      goal.connections.each do |connection|
        buddies << connection.buddy
      end
    end
    buddies
  end

end
