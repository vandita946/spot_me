class Goal < ApplicationRecord
  belongs_to :user
  has_one :chatroom, as: :topic
end
