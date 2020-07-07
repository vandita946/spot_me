class Milestone < ApplicationRecord
  belongs_to :goal

  has_one :completion_message

  validates :name, :deadline, :weightage, presence: true
  validates :weightage, inclusion: { in: (1..5) }
end
