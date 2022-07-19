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

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :charges)
  end
  
  
end
