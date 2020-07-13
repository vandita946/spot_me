class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owner_connections, :class_name => 'Connection', :foreign_key => 'owner_id'
  has_many :buddy_connections, :class_name => 'Connection', :foreign_key => 'buddy_id'
  has_many :goals, dependent: :destroy
  has_many :messages
  has_many :connections, through: :owner_connections, source: :buddy
  has_many :fans, through: :buddy_connections, source: :owner
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
        if gc.connection.buddy == self
          owner = gc.connection.owner
          goal = gc.goal
          buddyofs << { owner: owner,
            goal: goal }
        end
      end
    end
  buddyofs
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

