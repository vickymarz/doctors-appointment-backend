class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :name, presence: true
end
