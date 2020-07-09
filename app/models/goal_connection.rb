class GoalConnection < ApplicationRecord
  belongs_to :connection
  belongs_to :goal
  has_one :goal
  has_one :buddy, through: :connections
  has_one :owner, through: :connections

  # def buddyofs(user)
  #   buddyofs = []
  #   self.each do |gc|
  #     buddyofs << gc.connection.owner if gc.connection.buddy == user
  #   end
  #   buddyofs
  # end
end
