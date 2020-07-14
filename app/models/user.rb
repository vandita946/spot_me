class User < ApplicationRecord
  attr_accessor :goal, :contact

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # To prevent recreating the same email account / override
  validates :email, presence: true, uniqueness: true
  
  has_many :owner_connections, :class_name => 'Connection', :foreign_key => 'owner_id'
  has_many :buddy_connections, :class_name => 'Connection', :foreign_key => 'buddy_id'
  has_many :goals, dependent: :destroy
  has_many :messages
  has_many :connections, through: :owner_connections, source: :buddy
  # has_many :connections, through: :buddy_connections, source: :owner
  has_many :fans, through: :buddy_connections, source: :owner
  # has_many :goal_connections, through: :connections, source: :goal
  # has_many :buddies, through: :goals_connection, source: :buddy


  # Used for creating connections when visitor registers from links provided
  after_save :generate_connection

  def generate_connection
    if self.goal
      connection = Connection.new(owner_id: Goal.find(self.goal).user_id, buddy_id: self.id)
      connection.save!
      goal_connection = GoalConnection.create(connection_id: connection.id, goal_id: self.goal, status: "Accepted")
    elsif self.contact
      connection = Connection.new(owner_id: self.contact, buddy_id: self.id)
      connection.save!
    end
  end



  has_one_attached :avatar
  after_commit :add_default_avatar, on: [:create, :update]
  # has_many :goal_connections, through: :goals, source: :goal
  # has_many :buddies, through: :goals_connection, source: :buddy

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/default_profile.jpg"
    end
  end

  def buddies
    buddies = []
    self.goals.each do |goal|
      goal.goal_connections.each do |gc|
        buddies << gc.connection.buddy if gc.status == "Accepted"
      end
    end
    buddies
  end

  def buddyofs
    buddyofs = []
    Goal.all.each do |goal|
      goal.goal_connections.each do |gc|
        if gc.status == "Accepted"
          buddyofs << gc.connection.owner if gc.connection.buddy == self
        end
      end
    end
  buddyofs
  end


  def fullinfo_buddyofs
    buddyofs = []
    Goal.all.each do |goal|
      goal.goal_connections.each do |gc|
        if gc.connection.buddy == self && gc.status == "Accepted"
          owner = gc.connection.owner
          goal = gc.goal
          buddyofs << { owner: owner,
            goal: goal }

        end
      end
    end
  buddyofs
  end

  def requests
    requests = []
    GoalConnection.where(status: "Requested").each do |gc|
      if (gc.connection.buddy == self || gc.connection.owner == self) && gc.goal.owner != self
        requests << gc
      end
    end
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.jpg'
          )
        ),
        filename: 'default_profile.jpg',
        content_type: 'images.jpg',
      )
    end
  end

end
