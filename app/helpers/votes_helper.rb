module VotesHelper

  def check_vote(vote_params)
    if vote = Vote.find_by(vote_params.except(:value))
      vote.assign_attributes(vote_params)
      vote
    else
      Vote.new(vote_params)
    end

  end


end
