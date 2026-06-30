class HealthGoal < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
end
