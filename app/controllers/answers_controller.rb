class AnswersController < ApplicationController
  include VotesHelper
  def new
    @question = Question.find(parms[:id])
  end

  def create
    answer = Answer.new(body: params[:answers][:body], user: current_user, question_id: params[:answers][:question_id])
    if answer.save
      redirect_to question_path(answer.question)
    else
      flash[:notice] = "Something went wrong saving your answer."
      render 'answers/show'
    end
  end

  def updated
  end

  def edit
  end

  def destroy
  end

  def vote
   vote = check_vote(vote_params)
    if vote.save
      redirect_to :back
    else

      flash[:notice] =  "Sorry, your vote doesn't count"
      redirect_to :back
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value).merge(user: current_user, voteable_id: params[:vote][:answer], voteable_type: "Answer")
  end

end
