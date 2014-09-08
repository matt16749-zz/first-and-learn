module ApplicationHelper
  def redirect_to_sign_up
    redirect_to new_user_session_path and return unless user_signed_in?
  end

  def vote_count(voteable_id, voteable_type)
    class_name = voteable_type.classify.constantize
    up_votes = class_name.find(voteable_id).votes.where(vote_state: true)
    down_votes = class_name.find(voteable_id).votes.where(vote_state: false)
    up_votes.count - down_votes.count
  end
end
