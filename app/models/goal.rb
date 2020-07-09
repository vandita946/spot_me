class Goal < ApplicationRecord
 # before_create do
 #    self.day ||= Date.today unless self.day
 #  end

  belongs_to :user
  has_one :chatroom, as: :topic
  has_one :goal_connection, as: :goal
  has_many :milestones
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :start_date, presence: true
  # validates :status, inclusion: { in: ["Not Started", "In Progress", "Completed", "Archived"] }

  def get_latest
    incomplete = self.milestones.where(is_completed: false)
    sorted = incomplete.sort_by(&:deadline).first
  end

end
