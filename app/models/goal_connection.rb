class GoalConnection < ApplicationRecord
  belongs_to :connection
  belongs_to :goal
  has_one :buddy, through: :connections
  has_one :owner, through: :connections
end
