class GoalConnection < ApplicationRecord
  belongs_to :connection
  belongs_to :goal
  has_one :buddy, through: :connections
  has_one :owner, through: :connections
  validates :status, inclusion: { in: ["Requested", "Accepted", "Declined"] }
  validates_uniqueness_of :connection_id, scope: :goal_id
end
