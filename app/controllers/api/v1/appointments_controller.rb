class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[destroy]

  def index
      @appointments = current_user.appointments
      render json: @appointments
  end

  def create
    date = Date.parse(params[:date])
    save_params = appointment_params
    save_params[:date] = date
    @appointment = current_user.appointments.new(save_params)

    if @appointment.save
      render json: {
        message: 'Reservation Successful',
        status: 201
      }, status: :created

    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'Appointment deleted succesfully.' } if @current_appointment.destroy
  end

  private

  def set_appointment
    @current_appointment = current_user.appointments.find(params[:id]) if current_user.appointments.exists?(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :city, :doctor_id, :user_id) 
  end
end
