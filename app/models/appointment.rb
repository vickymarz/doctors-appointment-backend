class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :city, presence: true
  validates :date, presence: true
end
