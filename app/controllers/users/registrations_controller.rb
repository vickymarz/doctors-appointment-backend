class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private 

  def respond_with(resource, opt = {})

    register_success && return if resource.persisted?

    register_failed
  end

  def register_success(_resource)
    render json: {message: 'Signed up sucessfully', user:current_user}, status: 200
  end

  def register_failed
    render json: {message: 'Something went wrong'}, status: :unprocessable_entity
  end  
end
