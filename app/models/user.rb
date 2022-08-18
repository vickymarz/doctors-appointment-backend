class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :jwt_authenticatable, 
         :registerable, :validatable,
         jwt_revocation_strategy: self

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :name, presence: true
end
