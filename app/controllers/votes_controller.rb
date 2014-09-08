class VotesController < ApplicationController
  before_action :voteable

  def new
    redirect_to user_session_path unless user_signed_in?
    vote = Vote.new
  end

  def create
    if current_user
      vote = Vote.new()
      vote.user_id = current_user.id
      vote.vote_state = params[:voteState]
      vote.voteable_id = params[:voteableId]
      vote.voteable_type = params[:voteableType]
      vote.save
    end
    render json: vote
  end

  def update
    redirect_to user_session_path unless user_signed_in?
  end

private

  def vote_params
    params.require(:vote).permit(:id, :user_id, :vote_state, :voteable_type, :voteable_id)
  end

  def voteable
    @voteable = find_voteable
  end

  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
