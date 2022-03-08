class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      id: current_user.id,
      email: current_user.email,
      first_name: current_user.first_name,
      last_name: current_user.last_name
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "Vous etes déconnecté" }, status: :ok
  end

  def log_out_failure
    render json: {
      error: {
        title: "une erreur s'est produite"
      }
    }, status: :unauthorized
  end
end
