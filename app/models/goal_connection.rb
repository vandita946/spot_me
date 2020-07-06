class GoalConnection < ApplicationRecord
  belongs_to :connection
  belongs_to :goal
end
