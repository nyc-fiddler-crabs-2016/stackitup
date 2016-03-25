module VotesHelper

  def check_vote(vote_params)
    if vote = Vote.find_by(user: current_user, voteable_id: vote_params[:voteable_id], voteable_type: "Question")
      vote.assign_attributes(vote_params)
      vote
    else
      Vote.new(vote_params)
    end

  end


end
