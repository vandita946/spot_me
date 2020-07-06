class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_connections, :class_name => 'Connection', :foreign_key => 'owner_id'
  has_many :buddy_connections, :class_name => 'Connection', :foreign_key => 'buddy_id'
end
