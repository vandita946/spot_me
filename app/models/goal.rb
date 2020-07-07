class Goal < ApplicationRecord
  belongs_to :user
  has_one :chatroom, as: :topic
  has_one :goal_connection, as: :goal
  has_many :milestones
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :progress, numericality: { equal_to: 0.0 }
end
