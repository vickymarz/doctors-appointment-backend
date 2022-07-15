class V1::AppointmentsController < ApplicationController
before_action :set_appointment, only: %i[ show edit update destroy ]
  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    if @appointment.save
      render :create, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
