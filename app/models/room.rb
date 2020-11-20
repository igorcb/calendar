class Room < ApplicationRecord
  validates :name, presence: true 
  validates :status, presence: true

  has_many :meetings, dependent: :destroy

  enum status: { not_occuped: 1, occuped: 2 }
end
