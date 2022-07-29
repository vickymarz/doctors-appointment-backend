class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[destroy]
  def index
    @appointments = current_user.appointments

    render json: { appointments: @appointments }.to_json
  end

  def create
    date = Date.parse(params[:date])
    save_params = appointment_params
    save_params[:date] = date
    @appointment = current_user.appointments.new(save_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Appointment deleted succesfully.' } if @appointment.destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :date, :city, :doctor_id)
  end
end
