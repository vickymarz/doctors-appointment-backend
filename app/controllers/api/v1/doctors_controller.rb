class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { doctors: @doctors}.to_json, status: :success
  end
end
