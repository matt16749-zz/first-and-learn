module ApplicationHelper
  def redirect_to_sign_up
    redirect_to new_user_session_path and return unless user_signed_in?
  end
end
