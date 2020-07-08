class Connection < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :buddy, :class_name => 'User'
  has_one :chatroom, as: :topic
end
