class Chatroom < ApplicationRecord
  belongs_to :topic, polymorphic: true
end