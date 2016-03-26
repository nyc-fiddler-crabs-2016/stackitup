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
      # render 'answers/show'
    end
  end

  def edit
    question = Question.find(params[:id])
  end

  def update
    answer = Answer.find(params[:answer][:answer_id])
    if answer.user == current_user
      answer.update(answer_params)
      render partial: 'answers/show'
      #redirect_to question_path(params[:answer][:question_id])
    else
      flash[:notice] = "You cannot update any one else's answers..."
    end
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

  def answer_params
    params.require(:answer).permit(:body)
  end

end
