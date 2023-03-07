class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :date

  belongs_to :doctor
end
