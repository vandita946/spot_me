class Goal < ApplicationRecord
  belongs_to :user
  has_one :chatroom, as: :topic
  #has_one :goal_connection, as: :goal
  has_many :milestones
  has_many :goal_connections
  has_many :connections, through: :goal_connections
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :status, inclusion: { in: ["Not Started", "In Progress", "Completed", "Archived"] }

  # before_save :ensure_one_goal_connection

  def get_latest
    incomplete = self.milestones.where(is_completed: false)
    sorted = incomplete.sort_by(&:deadline).first
  end

  # def ensure_one_goal_connection
  #   false if self.goal_connections > 1
  # end

end
