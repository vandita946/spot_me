class Goal < ApplicationRecord
 # before_create do
 #    self.day ||= Date.today unless self.day
 #  end

  ICONS = {"suitcase" => "<i class='fa fa-suitcase'></i>",'heart' => "<i class='fa fa-heart'></i>", 'trophy' => "<i class='fa fa-trophy'></i>"}


  belongs_to :user
  has_one :chatroom, as: :topic
  #has_one :goal_connection, as: :goal

  has_many :milestones
  has_many :goal_connections
  has_many :connections, through: :goal_connections
  validates :user, presence: true
  validates :title, :description, :start_date, :deadline, :icon, presence: true

  # validates :status, inclusion: { in: ["Not Started", "In Progress", "Completed", "Archived"] }

  validates :icon, inclusion: { in: ["<i class='fa fa-suitcase'></i>", "<i class='fa fa-heart'></i>", "<i class='fa fa-trophy'></i>"] }

  # before_save :ensure_one_goal_connection

  def get_latest
    incomplete = self.milestones.where(is_completed: false)
    sorted = incomplete.sort_by(&:deadline).first
  end

  # def ensure_one_goal_connection
  #   false if self.goal_connections > 1
  # end
end

