class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :specialization, presence: true
  validates :charges, presence: true
  validates :photo, presence: true
end
