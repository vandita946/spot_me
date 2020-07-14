class Goal < ApplicationRecord

  belongs_to :user
  has_one :chatroom, as: :topic
  # has_one :goal_connection, as: :goal
  has_many :milestones, dependent: :destroy
  accepts_nested_attributes_for :milestones, allow_destroy: true
  has_many :goal_connections
  has_many :connections, through: :goal_connections
  validates :user, presence: true
  validates :title, :description, :start_date, :deadline, :icon, presence: true


  # validates :status, inclusion: { in: ["Not Started", "In Progress", "Completed", "Archived"] }
  # before_save :ensure_one_goal_connection

  def get_latest
    incomplete = self.milestones.where(is_completed: false)
    sorted = incomplete.sort_by(&:deadline).first
  end

  # def ensure_one_goal_connection
  #   false if self.goal_connections > 1
  # end

  def get_goal_buddies(user)
    goal_buddies = []
    self.goal_connections.each do |gc|
      goal_buddies << gc.connection.buddy if gc.connection.owner == user
    end
    goal_buddies
  end

  def blog_template
    goal = { title: "Launch my blog", description: "I'm going to finally publish the content ideas I've had for years!", icon: "laptop", start_date: Date.today, deadline: Date.today + 60}
    milestone_1 = { name: "Think of and register a url!", deadline: Date.today + 3, weightage: 3 }
    milestone_2 = { name: "Draft out my first post", deadline: Date.today + 7, weightage: 4 }
    milestone_3 = { name: "Publish and share my blog on at least 2 platforms", deadline: Date.today + 14, weightage: 5 }
    template = { goal: goal, milestones: [milestone_1, milestone_2, milestone_3] }
    return template
  end

  def vacation_template
    goal = { title: "Dream vacay", description: "Time to go on that Bali trip I've been dreaming of!", icon: "suitcase", start_date: Date.today, deadline: Date.today + 60}
    milestone_1 = { name: "Set a budget", deadline: Date.today + 3, weightage: 3 }
    milestone_2 = { name: "Coordinate with friends to set a date", deadline: Date.today + 7, weightage: 4 }
    milestone_3 = { name: "Book flight tickets and accommodation", deadline: Date.today + 14, weightage: 5 }
    template = { goal: goal, milestones: [milestone_1, milestone_2, milestone_3] }
    return template
  end

  def dating_template
    goal = { title: "Find the one", description: "Let's get hitched!", icon: "heart", start_date: Date.today, deadline: Date.today + 365}
    milestone_1 = { name: "Download a dating app and get BFF to vet my profile", deadline: Date.today + 3, weightage: 3 }
    milestone_2 = { name: "Have meaningful converstaions with at least 5 people", deadline: Date.today + 7, weightage: 4 }
    milestone_3 = { name: "Ask someone out!!", deadline: Date.today + 14, weightage: 5 }
    template = { goal: goal, milestones: [milestone_1, milestone_2, milestone_3] }
    return template
  end

  def marathon_template
    goal = { title: "Run a marathon", description: "I want to push myself beyond my limits!", icon: "trophy", start_date: Date.today, deadline: Date.today + 90}
    milestone_1 = { name: "Look for a safe route near my home", deadline: Date.today, weightage: 3 }
    milestone_2 = { name: "Go on my first 3k run", deadline: Date.today + 3, weightage: 4 }
    milestone_3 = { name: "Register for the local marathon", deadline: Date.today + 14, weightage: 5 }
    template = { goal: goal, milestones: [milestone_1, milestone_2, milestone_3] }
    return template
  end

end
