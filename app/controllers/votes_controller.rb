class VotesController < ApplicationController
  before_action :voteable

  def new
    redirect_to user_session_path unless user_signed_in?
    vote = Vote.new
  end

  # def create
  #   redirect_to user_session_path and return unless user_signed_in?
  #   vote = @voteable.votes.build(vote_params)
  #   vote.user_id = current_user.id
  #   vote.vote_state = params[:vote_state]
  #   if vote.save
  #     flash[:notice] = "Successfully created vote."
  #     redirect_to polymorphic_path(@voteable)
  #   else
  #     render :action => 'new'
  #   end
  # end

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
