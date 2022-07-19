class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { doctors: @doctors}.to_json, status: :success
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def show
    @doctor = Doctor.includes(:appointments).find(params[:id])

    @appointments = @doctor.appointments.order(created_at: :desc)

    @user = @doctor.appointments.current_user
    
    render json: { doctor: @doctor, @appointments, @user }, status: :created
    
  end
  

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :charges)
  end
  
  
end
