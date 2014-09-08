class VotesController < ApplicationController
  include ApplicationHelper
  before_action :voteable
  before_action :redirect_to_sign_up, only: [:new, :create, :update]

  def new
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
    render json: {vote_count: vote_count(vote.voteable_id, vote.voteable_type)}
  end

  def update
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

  def vote_count(voteable_id, voteable_type)
    class_name = voteable_type.classify.constantize
    up_votes = class_name.find(voteable_id).votes.where(vote_state: true)
    down_votes = class_name.find(voteable_id).votes.where(vote_state: false)
    up_votes.count - down_votes.count
  end
end
