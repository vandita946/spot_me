class Chatroom < ApplicationRecord
  belongs_to :topic, polymorphic: true, dependent: :destroy

  has_many :messages
end