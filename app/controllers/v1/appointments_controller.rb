class V1::AppointmentsController < ApplicationController
before_action :set_appointment, only: %i[ show destroy ]
  def index
    @appointments = current_user.appointments

    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
      render json: { appointment: @appointment, message: "Appointment deleted." }
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :date, :city)
  end
end
