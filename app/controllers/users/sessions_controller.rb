class Users::SessionsController < Devise::SessionsController
  private

  def respond_with(_resource, _opts = {})
    login_success && return if current_user

    login_failed
  end

  def login_success
    render json: {
      message: 'You are logged In',
      user: current_user,
      token: request.env['warden-jwt_auth.token'],
      status: 200
    }, status: :ok
  end

  def login_failed
    render json: {
      message: 'Invalid login credentials',
      status: 401
    }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: {
      message: 'You are logged out',
      status: 204
    }, status: :ok
  end

  def log_out_failure
    render json: {
      message: 'something went wrong'
    }, status: :unauthorized
  end
end
