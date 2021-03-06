class ApplicationController < ActionController::API
  def error_formatter(resource, status = :unprocessable_entity)
    render json: {
      error: {
        title: "une erreur s'est produite",
        message: resource.errors.full_messages.join('; ')
      }
    }, status: status
  end

  def render_user_json
    avatar = if current_user.avatar.attached?
               rails_blob_url(current_user.avatar)
             end
    render json: {
      id: current_user.id,
      email: current_user.email,
      first_name: current_user.first_name || nil,
      last_name: current_user.last_name || nil,
      avatar: avatar
    }, status: :ok
  end
  
end
