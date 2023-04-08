class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json
  include ActionController::MimeResponds

  # Method for checking if current_user is admin or not.
  def is_admin?
    render json: {"errors":[{"status":"401","title":"Unauthorized"}]}, status: 401 unless !current_user.nil? && current_user.is_admin?
  end
  
end
