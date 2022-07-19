class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { doctors: @doctors}.to_json, status: :ok
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: {
      message: 'Doctor added successfully',
    }, status: :ok

    else
      render json: {
      message: 'something went wrong'
    }, status: :unprocessable_entity
    end
  end

  def show
    @doctor = Doctor.includes(:appointments).find(params[:id])

    @appointments = @doctor.appointments.order(created_at: :desc)

    
    # @user = @doctor.appointments
    
    render json: { 
      doctor: @doctor,
      appointments: @appointments,  
      # user: @user
    }.to_json, status: :created
    
  end
  
  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :charges)
  end
end
