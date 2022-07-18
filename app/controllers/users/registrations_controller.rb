class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json


  def respond_with(resource)

    register_success(resource) && return if resource.persisted?

    register_failed
  end

  def register_success(_resource)
    render json: {message: 'Signed up sucessfully', status: 200}
  end

  def register_failed
    render json: {message: 'Something went wrong'}
  end  
end
