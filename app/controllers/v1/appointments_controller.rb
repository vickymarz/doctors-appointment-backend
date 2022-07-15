class V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def index
    @appointments = current_user.appointments
  end

  
end
