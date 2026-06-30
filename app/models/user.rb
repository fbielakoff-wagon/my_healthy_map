class User < ApplicationRecord
  has_many :health_goals, dependent: :destroy
  has_many :chats, dependent: :destroy
end
