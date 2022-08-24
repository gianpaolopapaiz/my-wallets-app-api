class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_error_message(model)
    render json: { errors: model.errors.messages }, status: :unprocessable_entity
  end

  def render_unauthorized_message
    render json: { message: 'You are not authorized'}, status: :unauthorized
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
