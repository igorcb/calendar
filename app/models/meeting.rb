class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, :room_id, :name, :start_date, :end_date, presence: true 
  validates :start_date, between_date: true
  validates :end_date, between_date: true

end
