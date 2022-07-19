class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { doctors: @doctors}, status: ok
  end
end
