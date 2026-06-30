class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :health_goals, dependent: :destroy
  has_many :chats, dependent: :destroy
end
