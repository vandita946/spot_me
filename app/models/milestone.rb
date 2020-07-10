class Milestone < ApplicationRecord

  after_save :update_goal_progress
  belongs_to :goal

  has_one :completion_message, dependent: :destroy

  validates :name, :deadline, :weightage, presence: true
  validates :weightage, inclusion: { in: (1..5) }

  def update_goal_progress
    # milestone weightage is set by the user 1-5. (or 1 by default)
    # progress is supposed to be a percentage / 100
    total = 0
    completed = 0
    self.goal.milestones.each do |milestone|
      total += milestone.weightage
      if milestone.is_completed == true
        completed += milestone.weightage
      end
    end
    progress = completed.fdiv(total) * 100
    self.goal.progress = progress
    self.goal.status = "Completed" if progress == 100.0
    self.goal.save
  end
end
